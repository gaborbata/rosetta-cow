use std::env;

fn template(text: &str) -> String {
    format!(
        r#"
 {}
< {} >
 {}
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
"#,
        border(text, "_"),
        text,
        border(text, "-")
    )
}

fn border(text: &str, chr: &str) -> String {
    chr.repeat(text.chars().count() + 2)
}

fn main() {
    let args: Vec<String> = env::args().skip(1).collect();
    if args.len() == 1 {
        let text = &args[0];
        println!("{}", template(text));
    } else {
        println!("Usage: cowsay [message]");
    }
}
