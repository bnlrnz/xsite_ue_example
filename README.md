# xsite_ue_example
Example project that utilises the [xsite_ue plugin](https://github.com/bnlrnz/xsite_ue) for Caves or multi monitor setups. xsite_ue is included as a git submodule, make shure to clone with "--recursive" or init the submodule later.

Built for Unreal Engine 4.25.3 (4.25.0-4.25.2 or newer versions may or may not work...)

### Installation

```Bash
git clone --recursive git@github.com:bnlrnz/xsite_ue_example.git
cd xsite_ue_example
git lfs install
git lfs pull
```
Open .uproject file with Unreal Editor

### Configuration

There are 3 example configuration files (and our full configuration) available in the content folder (the json files). They do not contain any warping or blending stuff and work on a single machine.

Hierarchy is as follows:

Coordinate system in config: left hand (x, left-right; y, top-bottom), -z is front; usually meters if not stated otherwise

```
root
|
|----system // this is only used to label this file, it will not be used inside unreal
|----date   // as system
|----eye    // the position of the camera in meters
|----walls  // an array that contains the definitions of planar surfaces on which we will project our screens/windows
       |
       |----name   // to identify the wall
       |----size   // in meters, width and height, you can simply measure or just choose a size with the correct aspect ratio
       |----normal // in which direction does the wall face
       |----bounds
       |       |----top_left
       |       |----bottom_right  // the extents of the wall in real world coordinates (meters), this should corresponde with the size
       |
       |----camera
       |      |----F  // camera intrisics, you can leave these empty if you dont need/want to warp
       |      |----Fi // camera intrisics, you can leave these empty if you dont need/want to warp
       |
       |----clients // an array that contains all computers which will participate in rendering the scene
              |----name // this is important, place hostname here, it will identify which extra window to spawn! * is a wildcard here, every computer will spawn the following screens/projectors
              |----id   // not used for now, ignore this
              |----ip   // not used for now, ignore this
              |----projectors // array of windows that will be spawned
                        |----name       // just an identifier
                        |----id         // not used for now, ignore this
                        |----display    // not used for now, ignore this
                        |----screen     // not used for now, ignore this
                        |----resolution // the windows resolution
                        |----offset     // the windows offset (top left corner position),e.g. you can use this in an extended FullHD dual monitor setup to shift one window 1920px to the right/left
                        |----alphamask  // name of the png file that includes the alpha mask, this is used for blending, if you leave this blank no blending shader will be applied
                        |----corners // this contains the definition of some corners/extents for several coordinate systems (not all are used/usefull for us)
                        |       |----projector_space // not used for now, ignore this
                        |       |----camera_space    // not used for now, ignore this; the extents of this screen/projector in camera space coordinates
                        |       |----display_space   // this is important; the relativ extents of this screen/projector corresponding to its wall
                        |
                        |----view_volume  // not used for now, ignore this; the coordinates defining the view frustum; this is calculated by the other values in unreal coordinates
                        |----H_x,H_y,Hi_x,Hi_y // warping parameters, you can leave these empty if you dont need/want to warp
```
