#!/bin/bash

website=$(curl https://economictimes.indiatimes.com/markets/cryptocurrency)
echo $(date)  > result.txt
TopGainers=$(echo "$website" | grep -Po 'Top Crypto Gainers.*?</tbody>' | grep -Po '<tr.*?>\K.*?(?=</tr>)')
echo '\nHere are the Top gainers :\n' >> result.txt
while read line
do
        name=$(echo "$line" | grep -Po '(?<=<td title=").*?(?=")')
        price=$(echo "$line" | grep -Po '(?<=class="fw_600">)[\d\.]+?(?=</td)')
        chg24=$(echo "$line" | grep -Po '(?<=<i class="mkt_sprite icon_arrow"></i>).*?(?=</td>)')
        if ! [ -z "$price" ]
        then
                echo "NAME : $name, PRICE : $price ₹, LAST 24H : $chg24\n" >> result.txt
        fi
done <<< "$TopGainers"

TopLosers=$(echo "$website" | grep -Po 'Top Crypto Losers.*?</tbody>' | grep -Po '<tr.*?>\K.*?(?=</tr>)')
echo '\nHere are the Top losers :\n' >> result.txt
while read -r line
do
        name=$(echo "$line" | grep -Po '(?<=<td title=").*?(?=")')
        price=$(echo "$line" | grep -Po '(?<=class="fw_600">)[\d\.]+?(?=</td)')
        chg24=$(echo "$line" | grep -Po '(?<=<i class="mkt_sprite icon_arrow"></i>).*?(?=</td>)')
        if ! [ -z "$price" ]
        then
                echo "NAME : $name, PRICE : $price ₹, LAST 24H : $chg24\n" >> result.txt
        fi
done <<< "$TopLosers"

MostActive=$(echo "$website" | grep -Po 'Most Active Cryptocurrency.*?</tbody>' | grep -Po '<tr.*?>\K.*?(?=</tr>)')
echo '\nHere are the Most Active Cryptocurrency :\n' >> result.txt
while read -r line
do
        name=$(echo "$line" | grep -Po '(?<=<td title=").*?(?=")')
        price=$(echo "$line" | grep -Po '(?<=class="fw_600">)[\d\.,]+?(?=</td)')
        chg24=$(echo "$line" | grep -Po '(?<=<i class="mkt_sprite icon_arrow"></i>).*?(?=</td>)')
        if ! [ -z "$price" ]
        then
                echo "NAME : $name, PRICE : $price ₹, LAST 24H : $chg24\n" >> result.txt
        fi
done <<< "$MostActive"
echo end >> result.txt

echo $(<result.txt) >> data.txt

MSG=$(echo -e $(<result.txt))
TOKEN='YOUR_TELEGRAM_TOKEN'
CHAT_ID='YOUR_TELEGRAM_CHAT_ID'
URL="https://api.telegram.org/bot$TOKEN/sendMessage"
curl -s -X POST $URL -d chat_id=$CHAT_ID -d text="$MSG"