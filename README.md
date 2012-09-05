life.coffee
===========

Conway's Game of Life simulator in CoffeeScript
-----------------------------------------------	

###About
This script is a simple simulation of [John Conway's Game of Life](http://en.wikipedia.org/wiki/Conway's_Game_of_Life) cellular automaton.

This program is written for educational purposes. Therefore I would greatly appreciate any comments on features that could be added or algorithms to improve the efficiency of the simulator.

The script currently requires `timerFix.js` to work. This handy script helps to solve the "`this`" problem when passing a method to `setInterval()`. Both the script and explanation can be found [here](https://developer.mozilla.org/en-US/docs/DOM/window.setInterval#The_.22this.22_problem).

##Usage
Besides the html page provided. The simulator can be included in any page with the following tag:

	<canvas id="life" width=800 height=800></canvas>

##TO DO
The algorithms used currently for the simulation is simply and inefficient. I hope to implement a more advanced algorithm to handle a denser grid and quicker time steps.

In addition, I'd like to add the following features:
*   flexible size of the grid(`canvas` element)
*   a control panel with scroll bars that control the grid density and fps
*   start, reset and stop buttons on the control panel to control the iteration
*   clicking the cells on the grid will toggle its state(alive/dead).
*   user can select on the control panel different preset initial states, which can showcase various interesting grid patterns ([spaceship][], [glider gun][], [puffer train][])

##License
MIT License. See LICENSE file.


[spaceship]: http://en.wikipedia.org/riki/Spaceship_(CA)
[glider gun]: http://en.wikipedia.org/wiki/Gun_(cellular_automaton)
[puffer train]: http://en.wikipedia.org/wiki/Puffer_train_(CA)
