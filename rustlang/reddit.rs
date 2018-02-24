// Example code that deserializes and serializes the model.
// extern crate serde;
// #[macro_use]
// extern crate serde_derive;
// extern crate serde_json;
// 
// use generated_module::Reddit;
// 
// fn main() {
//     let json = r#"{"answer": 42}"#;
//     let model: Reddit = serde_json::from_str(&json).unwrap();
// }

extern crate serde_json;

#[derive(Serialize, Deserialize)]
pub struct Reddit {
    #[serde(rename = "message")]
    message: String,

    #[serde(rename = "error")]
    error: i64,
}
