class GameOfLife
	constructor: ->
		@SIZE = 80
		@CELL_SIZE = 10
		@WIDTH = @SIZE * @CELL_SIZE
		@HEIGHT = @WIDTH

		@cells = for x in [0...@SIZE]
			for y in [0...@SIZE]
				if Math.random() < 0.9
					false
				else
					true

		@ctx = document.getElementById("life").getContext('2d')
		@drawGridLines()

		@plot()

	drawGridLines: ->
		@ctx.strokeStyle = "#333"
		@ctx.lineWidth = 2
		for i in [0..@SIZE]
			offset = i * @CELL_SIZE
			@ctx.moveTo offset, 0
			@ctx.lineTo offset, @HEIGHT
			@ctx.moveTo 0, offset
			@ctx.lineTo @WIDTH, offset

		@ctx.stroke()

	plot: ->
		# @ctx.clearRect 0, 0, @WIDTH, @HEIGHT
		# @drawGridLines(@ctx)
		for i in [0...@SIZE]
			for j in [0...@SIZE]
				@ctx.fillStyle = if @cells[i][j] is true then "black" else "white"
				@ctx.fillRect i*@CELL_SIZE+1, j*@CELL_SIZE+1, @CELL_SIZE-2, @CELL_SIZE-2

	plot2: ->
		@ctx.clearRect 0, 0, @WIDTH, @HEIGHT
		@ctx.fillStyle = "white"
		@ctx.fillRect 0, 0, @WIDTH, @HEIGHT
		@drawGridLines()
		@ctx.fillStyle = "black"
		for i in [0...@SIZE]
			for j in [0...@SIZE]
				if @cells[i][j] is true
					@ctx.fillRect i*@CELL_SIZE+1, j*@CELL_SIZE+1, @CELL_SIZE-2, @CELL_SIZE-2

	iterate: ->
		size = @SIZE
		for i in [0...size]
			for j in [0...size]
				@cells[i][j] = (@cells[i][j] and @neighborCount(i, j, size) == 2) or @neighborCount(i, j, size) == 3	
		@plot()

	neighborCount: (x, y, size) ->
		nc = 0
		nc++ if @cells[(x + 1) % size][y]
		nc++ if @cells[(x + 1) % size][(y + 1) % size]
		nc++ if @cells[x][(y + 1) % size]
		nc++ if @cells[x][(((y - 1) % size) + size) % size]
		nc++ if @cells[(x + 1) % size][(y - 1) % size]
		nc++ if @cells[(((x - 1) % size) + size) % size][y]
		nc++ if @cells[(((x - 1) % size) + size) % size][(((y - 1) % size) + size) % size]
		nc++ if @cells[(((x - 1) % size) + size) % size][(y + 1) % size]
		return nc

window.onload = ->
	gol = new GameOfLife()
	#TO DO
	setInterval.call gol, gol.iterate, 100
	return
