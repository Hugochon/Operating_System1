#!/bin/bash

echo "Statistics of the day $(date) : " > msg.txt
echo '\n' >> msg.txt
echo '\n' >> msg.txt

Bitcoin=$(grep "$(date '+%a %b %d')" data.txt | grep -Po '(?<=NAME : Bitcoin).*?(?=NAME)')
echo '\nBitcoin price of the day :\n' > raw.txt
>temp.txt
while read line
do
        price=$(echo "$line" | grep -Po '(?<=PRICE : ).*?(?=₹)')
        if ! [ -z "$price" ]
        then
                echo "$price" >> temp.txt
        fi
done <<< "$Bitcoin"

sed 's/,//g' temp.txt >> raw.txt

Maxprice=$(grep -Eo '[0-9]+' raw.txt | sort -rn | head -n 1)
echo "The maximum price Bitcoin reached this day was $Maxprice ₹" >> msg.txt
echo '\n' >> msg.txt

Minprice=$(grep -Eo '[0-9]+' raw.txt | sort -rn | tail -n 1)
echo "The minimum price Bitcoin reached this day was $Minprice ₹" >> msg.txt
echo '\n' >> msg.txt
echo "The difference is therefore $(expr $Maxprice - $Minprice) ₹" >> msg.txt
echo '\n' >> msg.txt
echo '\n' >> msg.txt

Ethereum=$(grep "$(date '+%a %b %d')" data.txt | grep -Po '(?<=NAME : Ethereum).*?(?=NAME)')
echo '\nEthereum price of the day :\n' > raw.txt
>temp.txt
while read line
do
        price=$(echo "$line" | grep -Po '(?<=PRICE : ).*?(?=₹)')
        if ! [ -z "$price" ]
        then
                echo "$price" >> temp.txt
        fi
done <<< "$Ethereum"

sed 's/,//g' temp.txt >> raw.txt

Maxprice=$(grep -Eo '[0-9]+' raw.txt | sort -rn | head -n 1)
echo "The maximum price Ethereum reached this day was $Maxprice ₹" >> msg.txt
echo '\n' >> msg.txt

Minprice=$(grep -Eo '[0-9]+' raw.txt | sort -rn | tail -n 1)
echo "The minimum price Ethereum reached this day was $Minprice ₹" >> msg.txt
echo '\n' >> msg.txt
echo "The difference is therefore $(expr $Maxprice - $Minprice) ₹" >> msg.txt
echo '\n' >> msg.txt
echo '\n' >> msg.txt

Tether=$(grep "$(date '+%a %b %d')" data.txt | grep -Po '(?<=NAME : Tether).*?(?=NAME)')
echo '\nTether price of the day :\n' > raw.txt
>temp.txt
while read line
do
        price=$(echo "$line" | grep -Po '(?<=PRICE : ).*?(?=₹)')
        if ! [ -z "$price" ]
        then
                echo "$price" >> temp.txt
        fi
done <<< "$Tether"

sed 's/,//g' temp.txt >> raw.txt

Maxprice=$(grep -Eo '[0-9]*\.[0-9]+' raw.txt | sort -rn | head -n 1)
echo "The maximum price Tether reached this day was $Maxprice ₹" >> msg.txt
echo '\n' >> msg.txt

Minprice=$(grep -Eo '[0-9]*\.[0-9]+' raw.txt | sort -rn | tail -n 1)
echo "The minimum price Tether reached this day was $Minprice ₹" >> msg.txt
echo "The difference is therefore `echo $Maxprice-$Minprice | bc` ₹" >> msg.txt
echo '\n' >> msg.txt
echo '\n' >> msg.txt

BinanceUSD=$(grep "$(date '+%a %b %d')" data.txt | grep -Po '(?<=NAME : Binance USD).*?(?=NAME)')
echo '\nBinance USD price of the day :\n' > raw.txt
>temp.txt
while read line
do
        price=$(echo "$line" | grep -Po '(?<=PRICE : ).*?(?=₹)')
        if ! [ -z "$price" ]
                then
                echo "$price" >> temp.txt
        fi
done <<< "$BinanceUSD"

sed 's/,//g' temp.txt >> raw.txt

Maxprice=$(grep -Eo '[0-9]*\.[0-9]+' raw.txt | sort -rn | head -n 1)
echo "The maximum price Binance USD reached this day was $Maxprice ₹" >> msg.txt
echo '\n' >> msg.txt

Minprice=$(grep -Eo '[0-9]*\.[0-9]+' raw.txt | sort -rn | tail -n 1)
echo "The minimum price Binance USD reached this day was $Minprice ₹" >> msg.txt
echo "The difference is therefore `echo $Maxprice-$Minprice | bc` ₹" >> msg.txt
echo '\n' >> msg.txt
echo '\n' >> msg.txt

Dogecoin=$(grep "$(date '+%a %b %d')" data.txt | grep -Po '(?<=NAME : Dogecoin).*?(?=NAME)')
echo '\nDogecoin price of the day :\n' > raw.txt
>temp.txt
while read line
do
        price=$(echo "$line" | grep -Po '(?<=PRICE : ).*?(?=₹)')
        if ! [ -z "$price" ]
        then
                echo "$price" >> temp.txt
        fi
done <<< "$Dogecoin"

sed 's/,//g' temp.txt >> raw.txt

Maxprice=$(grep -Eo '[0-9]*\.[0-9]+' raw.txt | sort -rn | head -n 1)
echo "The maximum price Dogecoin reached this day was $Maxprice ₹" >> msg.txt
echo '\n' >> msg.txt

Minprice=$(grep -Eo '[0-9]*\.[0-9]+' raw.txt | sort -rn | tail -n 1)
echo "The minimum price Dogecoin reached this day was $Minprice ₹" >> msg.txt
echo "The difference is therefore `echo $Maxprice-$Minprice | bc` ₹" >> msg.txt
echo '\n' >> msg.txt
echo '\n' >> msg.txt

USDCoin=$(grep "$(date '+%a %b %d')" data.txt | grep -Po '(?<=NAME : USD Coin).*?(?=NAME)')
echo '\nUSD Coin price of the day :\n' > raw.txt
>temp.txt
while read line
do
        price=$(echo "$line" | grep -Po '(?<=PRICE : ).*?(?=₹)')
        if ! [ -z "$price" ]
        then
                echo "$price" >> temp.txt
        fi
done <<< "$USDCoin"

sed 's/,//g' temp.txt >> raw.txt

Maxprice=$(grep -Eo '[0-9]*\.[0-9]+' raw.txt | sort -rn | head -n 1)
echo "The maximum price USD Coin reached this day was $Maxprice ₹" >> msg.txt
echo '\n' >> msg.txt

Minprice=$(grep -Eo '[0-9]*\.[0-9]+' raw.txt | sort -rn | tail -n 1)
echo "The minimum price USD Coin reached this day was $Minprice ₹" >> msg.txt
echo "The difference is therefore `echo $Maxprice-$Minprice | bc` ₹" >> msg.txt
echo '\n' >> msg.txt
echo '\n' >> msg.txt

XRP=$(grep "$(date '+%a %b %d')" data.txt | grep -Po '(?<=NAME : XRP).*?(?=₹)')
echo '\nXRP price of the day :\n' > raw.txt
echo $XRP >> raw.txt
>temp.txt
while read line
do
        price=$(echo "$line" | grep -Po '(?<=PRICE : ).*?(?=₹)')
        if ! [ -z "$price" ]
        then
                echo "$price" >> temp.txt
        fi
done <<< "$XRP"

sed 's/,//g' temp.txt >> raw.txt

Maxprice=$(grep -Eo '[0-9]*\.[0-9]+' raw.txt | sort -rn | head -n 1)
echo "The maximum price XRP reached this day was $Maxprice ₹" >> msg.txt
echo '\n' >> msg.txt

Minprice=$(grep -Eo '[0-9]*\.[0-9]+' raw.txt | sort -rn | tail -n 1)
echo "The minimum price XRP reached this day was $Minprice ₹" >> msg.txt
echo "The difference is therefore `echo $Maxprice-$Minprice | bc` ₹" >> msg.txt
echo '\n' >> msg.txt
echo '\n' >> msg.txt

MSG=$(echo -e $(<msg.txt))
TOKEN='YOUR_TELEGRAM_TOKEN'
CHAT_ID='YOUR_TELEGRAM_CHAT_ID'
URL="https://api.telegram.org/bot$TOKEN/sendMessage"
curl -s -X POST $URL -d chat_id=$CHAT_ID -d text="$MSG" 