const fs = require('fs');
const eth = require('ethereumjs-util');
let regex = /^0x[a-fA-F0-9]{40}$/;

function writeData(ticket, challenge, instance, player){

    let data = {
        challenge: challenge,
        instance: instance,
        player: player
      }
  
      fs.writeFileSync(`tickets/${challenge}/${ticket}.json`, JSON.stringify(data), function (err) {
        if (err) throw err;
      });
}

function checkaddr(addr){
    if (!regex.test(addr)){
        console.log("error l'addresse eth n'est pas conforme")
        return false
    }else if(!eth.isValidChecksumAddress(addr)){
        console.log("error bad checksum address")
        return false
    }
    return true
}

module.exports = { writeData, checkaddr };