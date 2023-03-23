import React from 'react'
import ReactDOM from 'react-dom/client'
import { createBrowserRouter, RouterProvider } from 'react-router-dom';
import { SocketProvider } from './contexts/socket.context';
import './index.css'
import Chat from './pages/Chat';
import Login from './pages/Login';

const router = createBrowserRouter([
  {
    path: '/',
    element: <Login />
  },
  {
    path: '/chat',
    element: <Chat />
  }
]);

ReactDOM.createRoot(document.getElementById('root') as HTMLElement).render(
  <React.StrictMode>
    <SocketProvider>
      <div className="container flex h-full py-8" style={{ height: '100vh' }}>
        <RouterProvider router={router} />
      </div>
    </SocketProvider>
  </React.StrictMode>,
)
