extends SceneTree

# Paths for assets within the existing 'assets' directory
const ASSETS_DIR = "res://assets/"
const WHITE_TILE_PATH = ASSETS_DIR + "white_tile.png"
const BLACK_TILE_PATH = ASSETS_DIR + "black_tile.png"
const CIRCLE_PATH = ASSETS_DIR + "circle.png"

# Function to generate all assets
func _initialize():
    generate_circle()
    generate_tile(WHITE_TILE_PATH, Color(1, 1, 1, 1)) # White tile
    generate_tile(BLACK_TILE_PATH, Color(0, 0, 0, 1)) # Black tile
    print("All assets generated successfully.")
    quit()

# Function to generate the circle image
func generate_circle():

    var size = 64
    var radius = size / 2.0
    var image = Image.create(int(size), int(size), false, Image.FORMAT_RGBA8)
    for y in range(0, size):
        for x in range(0, size):
            var dx = x - radius
            var dy = y - radius
            if dx * dx + dy * dy <= radius * radius:
                image.set_pixel(x, y, Color(1, 0, 0, 1)) # Red
            else:
                image.set_pixel(x, y, Color(0, 0, 0, 0)) # Transparent
    image.save_png(CIRCLE_PATH)

# Function to generate a single tile (white or black)
func generate_tile(path: String, color: Color):
    var size = 64
    var image = Image.create(int(size), int(size), false, Image.FORMAT_RGBA8)
    image.fill(color)
    image.save_png(path)
