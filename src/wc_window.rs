// https://chatgpt.com/c/8bf47e9d-878f-41b2-8eb3-498817c0d7c0

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
pub fn wc_window() -> Result<JsValue, JsValue> {
    log_1(&"wc_window".into());
    let w = window();
    let w2 = w.as_ref();
    let data = vec![
        SystemInfo { name: "Status".into(),
            value: String::from(w2.expect("window").status().unwrap())},
        SystemInfo { name: "Origin".into(),
            value: String::from(w2.expect("origin").origin())},
        SystemInfo { name: "Secure Context".into(),
            value: w2.expect("secure").is_secure_context().to_string()},
    ];
    // Return the data as a JSON object
    Ok(serde_wasm_bindgen::to_value(&data)?)
}

#[cfg(test)]
mod tests {
    //~ use super::*;
    use wasm_bindgen_test::*;

    #[wasm_bindgen_test]
    fn test_wc_window() {
        //~ let _ = wc_window();
    }
}
