---
title: read up about Azure WebJobs
date: 2015/04/01
tags: [articles]
author: Jez Nicholson
time-spent: 1h
---
​Unfortunately, I missed the [Scott Hanselman](http://www.hanselman.com/) TIS Talk at work about Azure WebJobs, but his ['Introducing...' article](http://www.hanselman.com/blog/IntroducingWindowsAzureWebJobs.aspx​) has helped as an introduction.

It looks like a WebJob is a custom task the can either run continuously or be kicked off as a scheduled task. It can take input such as a Blob of data in a storage container, process it and put the output into another container. I don't know yet whether it will perform a callback to tell the trigger that it has finished.

The example in the article says that you have to deploy via a zip file, but this isn't completely true. [http://blog.amitapple.com/post/74215124623/deploy-azure-webjobs/​](http://blog.amitapple.com/post/74215124623/deploy-azure-webjobs/​) shows how it can be a web deploy or git.
​
There is a Getting Started tutorial here -> [http://azure.microsoft.com/en-us/documentation/articles/websites-dotnet-webjobs-sdk-get-started/​](http://azure.microsoft.com/en-us/documentation/articles/websites-dotnet-webjobs-sdk-get-started/​)