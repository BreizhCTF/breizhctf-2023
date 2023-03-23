import { useCallback, useContext, useEffect, useRef, useState } from "react";
import { redirect, useNavigate } from "react-router-dom";
import { SocketContext } from "../contexts/socket.context";

const Chat = () => {
    const navigate = useNavigate();
    const { messages, username, sendMessage } = useContext(SocketContext);
    const [message, setMessage] = useState('');
    const messageView = useRef<HTMLDivElement>(null);

    useEffect(() => {
        if (!username) {
            navigate('/');
        }
    }, [username]);

    const send = useCallback(() => {
        sendMessage(message);
        setMessage('');
        messageView.current?.scrollTo(0, messageView.current.scrollHeight)
    }, [message]);

    return (
        <div className="flex flex-col h-full w-full">
            <div className="flex flex-col flex-grow overflow-y-auto px-6" ref={messageView}>
                {messages.map((message, index) => (
                    <div key={index} className="bg-white rounded-lg shadow m-4 p-4">
                        <div className="text-slate-500 text-sm font-medium dark:text-slate-400">{message.authorName}</div>
                        <div className="text-slate-900 text-sm font-medium dark:text-slate-200">{message.message}</div>
                    </div>
                ))}

            </div>
            <form className="flex shrink-0 flex-row items-center h-16 rounded-xl bg-white w-full px-4 mt-4" onSubmit={e => { e.preventDefault(); send(); }}>
                <div className="flex-grow">
                    <input type="text" className="flex w-full border rounded-xl focus:outline-none focus:border-indigo-300 pl-4 h-10" value={message} onChange={e => setMessage(e.target.value)} />
                </div>
                <div className="ml-4">
                    <button className="flex items-center justify-center bg-indigo-500 hover:bg-indigo-600 rounded-xl text-white px-4 py-1 flex-shrink-0">
                        <span>Envoyer</span>
                    </button>
                </div>
            </form>
        </div>
    )
};

export default Chat;
