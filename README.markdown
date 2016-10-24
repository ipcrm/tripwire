#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with tripwire](#setup)
    * [What tripwire affects](#what-tripwire-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with tripwire](#beginning-with-tripwire)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Tripwire Puppet module objective is to automate the process of installing and connecting a Tripwire client to the Tripwire master   

## Module Description

Tripwire module was designed to allow a user to goto the Puppet console, select the Tripwire profile class, apply it to any Linux server hosted by the FS and have Tripwire installed and communicating with the Tripwire master

## Setup

To retrieve the public module code , please clone git clone git@github.com:autostructure/tripwire.git
The private data will need to be designed accordingly for your Organizations purpose

### What tripwire affects

Tripwire application monitors pre defined directories/files, this monitors the files / directories for any changes, this will help an organization determine if these changes were scheduled or unscheduled


### Setup Requirements **OPTIONAL**

If your module requires anything extra before setting up (pluginsync enabled, etc.), mention it here.

### Beginning with tripwire

In order to pull the public code into your Puppet Infrastructure please add the following line to your Puppetfile
mod "autostructure/tripwire"


## Usage

Within the Tripwire profile that can be seen by querying the class in the Puppet console
$twip <-- This parameter is the IP address to the Tripwire Master server to connect with
Integer[0, 65535] $twtripport <--- This is the port to connect to the Master Tripwire server with
String $pass <--- This is the passcode needed to make a successful connection to the Master
String $tripwire_installdir <--- This is where you would like Tripwire installed at on the Client Tripwire machine
te_agent_8.4.2_en_linux_x86_64/te_agent.bin <--- This is the file downloaded from a trusted repo, this file will install tripwire agent on the Client

## Reference

Here, list the classes, types, providers, facts, etc contained in your module. This section should include all of the under-the-hood workings of your module so people know what the module is touching on their system but don't need to mess with things. (We are working on automating this section!)

## Limitations

This is where you list OS compatibility, version compatibility, etc.

## Development

Since your module is awesome, other users will want to play with it. Let them know what the ground rules for contributing are.

## Release Notes/Contributors/Etc **Optional**

If you aren't using changelog, put your release notes here (though you should consider using changelog). You may also add any additional sections you feel are necessary or important to include here. Please use the `## ` header.
