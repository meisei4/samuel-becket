extends SceneTree

func _initialize():
    generate_background()
    generate_circle()
    print("Assets generated successfully.")
    quit()

func generate_background():
    var image = Image.create(512, 512, false, Image.FORMAT_RGB8)
    var cell_size = 64

    var toggle_row = false  # Keeps track of whether to start the row with white or black

    for y in range(0, 512, cell_size):
        var toggle_cell = toggle_row 
        for x in range(0, 512, cell_size):
            var color = Color(1, 1, 1) if toggle_cell else Color(0, 0, 0)
            image.fill_rect(Rect2i(x, y, cell_size, cell_size), color)
            toggle_cell = not toggle_cell  # Switch color for the next cell in the row
        toggle_row = not toggle_row  # Switch starting color for the next row

    image.save_png("res://background.png")


func generate_circle():
    var size = 64
    var radius = size / 2
    var image = Image.create(size, size, false, Image.FORMAT_RGBA8)

    for y in range(size):
        for x in range(size):
            var dx = x - radius
            var dy = y - radius
            if dx * dx + dy * dy <= radius * radius:
                image.set_pixel(x, y, Color(1, 0, 0, 1))  # Red
            else:
                image.set_pixel(x, y, Color(0, 0, 0, 0))  # Transparent
    image.save_png("res://circle.png")
