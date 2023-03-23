const { execSync } = require("child_process");
const express = require('express');
const cookieParser = require('cookie-parser');
const sessions = require('express-session');
var fs = require("fs");
var path = require("path");

const app = express();
const port = 3000;

var chall_name = {
    "1": "blockchain-101",
    "2": "randomGame",
    "3": "chateau",
    "4": "lucky",
    "5": "mutablePotion",
    "6": "broceliande",
}

const oneDay = 1000 * 60 * 60 * 24;
app.use(express.json());
app.use(express.static('web'));
app.use(sessions({
    secret: "cFN3d2ha0tenqyqjTt8mkFyM7VQq6jMcnFA84e",
    saveUninitialized:true,
    cookie: { maxAge: oneDay },
    resave: false 
}));
app.use(cookieParser())

app.get('/', function(req, res) {
    res.sendFile(path.join(__dirname, '/web/index.html'));
});

app.post('/deploy', function(req, res) {
    data = req.body;
    wallet = data.wallet;
    if(/^0x[a-fA-F0-9]{40}$/.test(wallet)){
        msg = deployChall(chall_name[data.id]);
        req.session.last_contract = msg
        req.session.last_contract_name = chall_name[data.id]
        res.cookie('addr', msg, { maxAge: 900000, httpOnly: false });
        res.send({"msg": msg})
    }else{
        res.send({"err": "Adresse incorrecte."});
    }
});

app.post('/faucet', function(req, res) {
    data = req.body;
    wallet = data.wallet;
    if(/^0x[a-fA-F0-9]{40}$/.test(wallet)){
        msg = faucet(wallet);
        last_wallet = wallet
    }else{
        msg = "Adresse incorrecte."
    }
    res.send({"msg": msg})
});

app.get('/flag', function(req, res) {
    if(req.session.last_contract && req.session.last_contract != ""){
        msg = isFlag(req.session.last_contract_name, req.session.last_contract)
    }else{
        msg = "Aucun contract déployé."
    }
    res.send({"msg": msg})
});

app.get('/reset', function(req, res) {
    req.session.last_contract = undefined;
    req.session.last_contract_name = undefined;
    res.clearCookie("addr");
    res.redirect('/');
});

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
});


function deployChall(challengeName) {
    try{
        return execSync("npx hardhat --network localhost "+challengeName+"_deploy").toString("utf8");
    }
    catch (err){ 
        return err.stderr.toString("utf8")
    }
}

function faucet(addr){
    try{
        return execSync("npx hardhat --network localhost faucet --address "+addr).toString("utf8");
    }
    catch (err){ 
        return err.stderr.toString("utf8")
    }
}

function isFlag(chall, addr){
    try{
        return execSync("npx hardhat --network localhost "+chall+"_isSolve --addresschallenge "+addr).toString("utf8");
    }
    catch (err){ 
        return err.stderr.toString("utf8")
    }
}