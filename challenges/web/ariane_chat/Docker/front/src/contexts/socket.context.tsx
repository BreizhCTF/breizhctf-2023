import { createContext, useMemo, useState } from "react";
import { io, Socket } from "socket.io-client";

export const SocketContext = createContext<{
    socket: Socket | null;
    messages: Array<{ authorName: string; message: string; }>;
    username: string | null;
    sendMessage: (message: string) => void;
    login: (username: string) => void;
}>({
    socket: null,
    messages: [],
    username: null,
    sendMessage: message => null,
    login: username => null
});

const url = import.meta.env.PROD ? '/' : 'http://localhost:3000';
const socket = io(url);

export const SocketProvider = ({ children }: React.PropsWithChildren<{}>) => {
    const [username, setUsername] = useState('');
    const [messages, setMessages] = useState<Array<{ authorName: string; message: string; }>>([]);

    socket.on('onMessage', (message: any) => {
        setMessages([ ...messages, message ]);
    });

    const sendMessage = (message: string) => {
        socket.emit('sendMessage', { message });
    };

    const login = (username: string) => {
        socket.emit('login', { username });
        setUsername(username);
    };

    return <SocketContext.Provider value={{
        socket,
        messages,
        username,
        sendMessage,
        login,
    }}>
        {children}
    </SocketContext.Provider>
};
