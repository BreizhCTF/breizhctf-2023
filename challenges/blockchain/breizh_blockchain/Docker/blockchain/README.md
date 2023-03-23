# Hardhat network docker to dockerise blockchain challenges

<!--## Launch by script

run this comment in your environement, with your public addr: 

```export user_addr=your_addr```

```bash start.sh``` -->

## Netcat format
```
Launch chall ?
    input : 
            - name chall
            - addr player
    
    output : 
            - ticket
            - addr challenge
    
    cmd : 
            # npx hardhat --network localhost challenge_deploy --playeraddr addr --challname name --amount ethervalue

    
```

### Kill the node processus because ctrl+c didn't work
``` ps aux | grep node```

``` kill _pidNumber_```

## Docker cmd
```docker build -t breizh .```

```docker run -p 8545:8545 -p 1337:1377 breizh:latest```

[Config of the local network --> hardhat.config.js ](https://hardhat.org/hardhat-network/docs/reference#config)

[Hardhat network helpers](https://hardhat.org/hardhat-network-helpers/docs/reference)

## Problem that can appens:

[metamask nonce too hight](https://medium.com/@thelasthash/solved-nonce-too-high-error-with-metamask-and-hardhat-adc66f092cd) 


_made by m4k2_
