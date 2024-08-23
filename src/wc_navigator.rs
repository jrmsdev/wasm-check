use wasm_bindgen::prelude::*;

use web_sys::console::log_1;
use web_sys::window;

use serde::{Serialize, Deserialize};
use serde_wasm_bindgen;

#[derive(Serialize, Deserialize)]
pub struct SystemInfo {
    name: String,
    value: String,
}

#[wasm_bindgen]
pub fn wc_navigator() -> Result<JsValue, JsValue> {
    log_1(&"wc_navigator".into());
    let n = window().unwrap().navigator();
    //~ let n2 = n.as_ref();
    let data = vec![
        SystemInfo { name: "App Name".into(), value: n.app_name()},
        SystemInfo { name: "App Version".into(), value: n.app_version().unwrap()},
        SystemInfo { name: "Platform".into(), value: n.platform().unwrap()},
        SystemInfo { name: "User Agent".into(), value: n.user_agent().unwrap()},
        SystemInfo { name: "Product".into(), value: n.product()},
        SystemInfo { name: "Language".into(), value: n.language().unwrap()},
        SystemInfo { name: "On Line".into(), value: n.on_line().to_string()},
    ];
    // Return the data as a JSON object
    Ok(serde_wasm_bindgen::to_value(&data)?)
}

#[cfg(test)]
mod tests {
    //~ use super::*;
    use wasm_bindgen_test::*;

    #[wasm_bindgen_test]
    fn test_wc_navigator() {
    }
}
