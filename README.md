# Operating_System1

Final project of Operating System. 

I scrapped https://economictimes.indiatimes.com/markets/cryptocurrency in order to get some information about the Top cryptocurrencies of the day and the Worst cryptocurrencies of the day (by the evolution of the price during the last 24 hours).

I also added the most popular cryptocurrencies, and made a daily recap of the evolution of their price.

The code_final.sh is for scrapping the information of all the cryptocurrencies every 30 minutes, and sending it by message on Telegram.
The recap.sh is for the daily recap, with the maximum and minimum price reached each day by the top 7 cryptocurrencies.

I used crontab to automate the execution of those two scripts :

    */30 * * * * /home/ubuntu/final_project/code_final.sh
    59 22 * * * /home/ubuntu/recap.sh

By Hugo SCHNEEGANS.