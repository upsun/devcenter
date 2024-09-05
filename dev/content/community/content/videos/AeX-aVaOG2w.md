---
#################################
# Don't touch these settings.
date: '2024-05-27T10:26:01+02:00'
sidebar:
    exclude: true
type: media
#################################
# Update the title
title: "Mastering linked data in PHP: Graphs and algorithms"

# (optional) Override the image produced for the video page.
# When undefined, the following will be used.
# image: https://img.youtube.com/vi/YOUTUBE_ID/hqdefault.jpg

# Update author with one or more
#   -> content/community/engage/people/AUTHOR.md
#   -> https://github.com/AUTHOR
#   -> AUTHORFirst AUTHORLast
author:
  - christian-rades
  
# Choose ONE of the options below:
categories:
  - talks
#   - livestreams
#   - podcasts
#   - talks
#   - webinars

# Tags don't do anything yet, so ignore for now.
tags:
  - events
#   - integrations
---
Linked data is everywhere: Object graphs, nested Documents, git commits. The structure of those links is often just as valuable as the data itself. This is why knowing how to store and manage those links opens opportunities. This talk will show you how to represent this data in PHP and how to use common algorithms to utilize the structure.

You will hear how we tamed nested documents to order their insertion into a relational database and show you all the places where these kinds of links appear.

We will close out with a little peek at how applying this knowledge can even help you guide the development of your code base.

This will enable you to spot the links in your data and apply well-known methods to get the most out of it.

Christian Rades, Pricipal Software Engineer, shopware AG.
______________________________________

Enterprise Symfony for the future: Platform.sh is the official Symfony Cloud Platform.
______________________________________

Experiment easily. Iterate quickly. Deploy responsibly. Introducing the Upsun PaaS.

Links to check out:
👉 Get your free Upsun trial: https://brnw.ch/21wFxKr
👉 Learn more about Blackfire: https://brnw.ch/21wFxKp
👉 Get started with Platform.sh: https://brnw.ch/21wFxKj

Key moments:
0:00 - Intro

2:00 - The 7 bridges problem
* Discusses the historical significance of the Seven Bridges problem and its mathematical implications.

6:29 - Nets and cities are graphs
* Explores how various structures like nets, cities, and maps can be represented as graphs.

7:00 - Graphs imply navigating
* Discusses how navigation in graphs relates to navigating data, introducing the concept of JQ for JSON data manipulation.

7:31 - How navigation relates to data
* Explores the connection between navigating graphs and manipulating data, highlighting the separation of data structure and content.

11:06 - Objects vs Tables (ORM)
* Discusses the challenge of mapping objects to relational database tables, using an example from Shopware and ORM.

14:40 - How to order a graph
* Introduces directed graphs and their relevance to dependency problems, explaining topological sorting and demonstrating K's algorithm for ordering nodes.

18:12 - What happens to cycles
* Discusses how to deal with cycles in graphs, suggesting using algorithms like depth-first search to detect and manage them.
* Demonstrates cycle detection using depth-first search on a graph, highlighting the importance of identifying and resolving cycles.

21:25 - Git is a graph
* Introduces Git as a graph, explaining its structure as a directed tree and its relevance to project history and optimization.
* Explores how Git's history can be leveraged to optimize software architecture by transforming Git data into a social network.

22:43 - Transformation into a social network
* Describes the process of transforming Git data into a social network to analyze how files in a project are interconnected through commits.
* Illustrates how commits represent meaningful changes and how files relate to each other based on their commit history.

26:12 - Weights
* Introduces the concept of weights in graphs, explaining how they represent the frequency of connections between nodes.
* Discusses the application of weights in determining the significance of connections and optimizing navigation through the graph.

27:17 - Betweenness centrality
* Explores the concept of betweenness centrality as a metric for measuring the importance of nodes in a graph.
* Discusses how betweenness centrality can identify critical nodes that act as bridges between different parts of the graph.

32:08 - Takeaways
* Summarizes the main insights from the talk, emphasizing the importance of considering structure in addition to data.
* Highlights the use of graph theory and algorithms to analyze and derive new insights from complex systems like software projects.
* Encourages further exploration and experimentation with graph-based approaches in various domains.

34:07 - Questions
37:54 - Ending