---
title: Fun at Brighton Hack Day
date: 2007/11/20
tags: [events,hacking]
author: Jez Nicholson
---
​​​​Well, as the title says, I had a bit of fun this weekend at the inaugoral Brighton Hack Farm.

The plan was fairly simple: turn up at 10am, spend the day hacking together some code, demo at 5pm. Implementation of the plan was slightly trickier, but ultimately successful.

I went along as part of the Brighton Coding Dojo group. We convened at 10(ish) and decided on a SCRUM-based effort. Thom had brought a box of sensors with him and after a quikc brainstorm I put foward the idea of an Inform text adventure interacting with from the physical world.

The team split into pairs to investigate the different sections of the project and reconvened every 1/2 hour or so. On the whole this worked extremely (no pun intended) well as it meant that we could attack the problem on multiple fronts. The main problem that I had was in finding the right syntax to use in Inform.

Around lunchtime we were joined by Mr Hopper Snr, who after hearing a little about the plan jumped in to story writing for the text adventure. I was focussed on producing a single simplest interaction to prove that the system would work, whereas Simon was interested in the story as a whole (i.e. start with the solution and work backwards). I split this off to be a separate activity and it worked well as it is easy to end up with a really lame text adventure if you focus on getting the mechanism working.

We nearly had an integration problem where an incomplete command would be issued to the game. This was because we didn't force a test.

The eventual demo worked a treat. Thom had adapted the temperature sensor at the last minute to be embedded in the bottom of a cut off Coke can. Hot or cold liquid could be poured into this and be in direct contact with the sensor. This would post a message to a web server which the demo laptop was polling. The Java Robot API was then used to write the appropriate command into the Inform game window at the prompt.
