# SWN-Apple-Projects
A portfolio of Projects that I have coded at Apple, personally, or class projects.

**Project 01:  Text Embedding for Question and Answering V02**
Goal:  The goal of this project to come up with a Proof of Concept for incorporating a text file(csv) file into OpenAI.
This way the user would be able to ask the ChatBot questions on a particular proprietary topic.
Inputs:  Open AI and 'Unicorns.csv' (file regarding a list of startup companies)  
OpenAI Model: 'text_davinci-003'
The script incorporates vector similarities and prompt embedding. 

**Project 02:  ChatGPT API History Tutor**
Goal:  To create a simple script for a ChatBot to serve as a US History Tutor
The Prompt requests the user to enter "END" to terminate the chat.
OpenAI Model:  GPT 3.5 Turbo

**Project 03:  Repair Code Verification**
Goal:  To build a Proof of Concept - a script that would allow us to know where a customer's device is stuck in a repair flow.  
The idea is that if we know what the expected repair flow should be, we can compare with what is currently in SAP and determine what is missing.
Inputs:  The Customers Withoout Devices (TCW) report which contains the latest SAP Header and Status Codes and compares them to the 
the happy flow that is coded into the script.  
The result is the difference between the two.
From there we will a note will be added to tell the user where to futher investigate.
Output: the final report (excel file) of the missing header and status and note to indicate further investigation.

**Project 04:  SWN Instagram Capstone Project**
Goal:  To create a sql database similar to what you would find in Instagram
The Database contained several tables (Users, Photos, Comments, Likes, Hashtags, Followers, Tags, and Photos Tags)
Along the way, there were a number of challenges to solve for:
  1.  Identify the Instagram users who have been around the longest
  2.  What day of the week do most users register on?
  3.  Find inactive users for targeted email campaign
  4.  Determine who has the most likes for a single photo.  
  5.  How many times does the average user post.
  6.  What are the top 5 most commonly used hastags?
  7.  Find users who have liked every single photo on the site.

**Project 05:  Splunk Force Quit Core**
Goal:  To determine how many Advisors over 30 days were having to Force Quit the Core application due to application errors and the impact to their work flow and customers.  
The query incorporates searching for a number of key phrases that Advisors would use.  Extracting those phrases from raw data and then tableing the results.  Over 30 Days, 1080 occurrences of Advisors needing to Force Quit Core due to applications issues. 
