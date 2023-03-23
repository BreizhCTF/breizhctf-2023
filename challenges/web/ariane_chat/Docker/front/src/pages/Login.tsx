import { useState, useCallback, useContext, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import { SocketContext } from "../contexts/socket.context";

const Login = () => {
    const { socket, login } = useContext(SocketContext);
    const navigate = useNavigate();

    const [usernameInput, setUsernameInput] = useState('');

    const onSubmit = useCallback(() => {
      login(usernameInput);
      navigate('/chat');
    }, [usernameInput]);

    return (
        <div className="w-full max-w-sm p-4 bg-white border border-gray-200 rounded-lg shadow sm:p-6 md:p-8 dark:bg-gray-800 dark:border-gray-700">
            <form className="space-y-6" action="#" onSubmit={e => { e.preventDefault(); onSubmit(); }}>
                <h5 className="text-xl font-medium text-gray-900 dark:text-white">Bienvenu sur Ariane Chat 🚀</h5>

                <div>Rejoignez une communauté passionné sur les sujet de l'astronomie</div>

                <div>
                    <label htmlFor="username" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Nom d'utilisateur</label>
                    <div className="flex">
                        <span className="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 border border-r-0 border-gray-300 rounded-l-md dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600">
                            @
                        </span>
                        <input type="text" name="username" id="username" className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-none rounded-r-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" placeholder="Flatearther" required value={usernameInput} onChange={e => setUsernameInput(e.target.value)} />

                    </div>
                </div>
                <button type="submit" className="w-full text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Entrer dans le chat</button>
            </form>
        </div>
    );
};

export default Login;
