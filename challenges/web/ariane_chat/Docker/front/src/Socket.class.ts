import { io, Socket } from 'socket.io-client';

export class RocketSocket {

    private _instance: RocketSocket | undefined;
    public get instance() {
        if (!this._instance) {
            this._instance = new RocketSocket();
        }
        return this._instance;
    }

    private connectionUri = window.location.hostname.indexOf('localhost') !== -1 ? 'http://localhost:3000' : '';
    public client: Socket;

    private constructor() {
        this.client = io(this.connectionUri);
    }
}