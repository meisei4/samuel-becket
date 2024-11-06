# godot investigation project

Godot using the CLI: https://docs.godotengine.org/en/stable/tutorials/editor/command_line_tutorial.html

## Setup

1. **Generate Assets**  
   Run the following command to generate `circle.png` and `background.png` assets (or just any GDScript:
   ```bash
   godot --headless -s generate_assets.gd
   ```

2. **Import Assets**  
   After generating, import the assets and set up all the meta-data that godot needs to run:
   ```bash
   godot --headless --import
   ```

3. **Run the Main Scene**  
   Start the main scene by running:
   ```bash
   godot
   ```

## Requirements
- Godot installed

