#[allow(unused_imports)]
#[cfg(debug_assertions)]
use bevy_dylib;

use bevy::prelude::*;

fn main() {
    App::new()
        .add_plugins(DefaultPlugins)
        .add_plugins(bevy_editor_pls::prelude::EditorPlugin::default())
        .run();
}
