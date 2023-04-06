---
title: "Developers Workstation"
date: 2023-01-19T14:53:23+01:00
draft: false
cover: 
    video: /add.mov
    alt: 'this is a video'
    caption: 'caption'

---


We will be explaining how to create VMs for our Developers
## Creating VMs

you will find the fils inside ./infrastructre/workstation and apply the terraform file using:

`$ terrafrom apply`

## Adding new developer

* To add a new developper you need to go to terraform modules workstation and modify the main.tf file and add a line to locals like shown bellow, specify your machine name, machine type, the zone, tags you need for example ssh or http or both, your preferd OS image and your bucket name which should be unique.







![Creating another workstation](/g.gif)

Video:

https://user-images.githubusercontent.com/62959061/229340280-1b1614f1-7140-4274-b8df-a177f1aecf0c.mov
cd

* After modfiying you need to apply the changes using:

`$ terrafrom apply`

