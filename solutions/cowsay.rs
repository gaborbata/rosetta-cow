use std::env;

const TEMPLATE: &str = r#"
 {}
< {} >
 {}
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
"#;

fn border(text: &str, chr: &str) -> String {
    return chr.repeat(text.chars().count() + 2);
}

fn main() {
    let args: Vec<String> = env::args().skip(1).collect();
    if args.len() == 1 {
        let text = &args[0];
        println!(
            "{}",
            TEMPLATE
                .replacen("{}", &border(text, "_"), 1)
                .replacen("{}", text, 1)
                .replacen("{}", &border(text, "-"), 1)
        );
    } else {
        println!("Usage: cowsay [message]");
    }
}
