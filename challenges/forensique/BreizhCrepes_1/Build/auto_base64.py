import string

letters = string.ascii_lowercase
result = ""
with open("random_base64.txt", "r") as input:
    for nb_line, line in enumerate(input):
        letter = letters[nb_line]
        idx = 0
        result += f'Dim {letter} As String\n'
        result += f'{letter} = "powershell -noP -sta -w 1 -enc "\n'
        for i in range(len(line)):
            if i%50 == 0 and i != 0:
                result += f'{letter} = {letter} + "{line[idx:i]}"\n'
                idx = i
        result += f'{letter} = {letter} + "{line[idx:i]}"\n'

with open("random_base64.vbs", "w") as output:
    output.write(result)
