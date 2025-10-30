use anyhow::Result;
use clap::Parser;
use clipboard_util::get_contents;

#[derive(Parser)]
#[command(about = "輸出剪貼簿內容，若無法讀取則使用備援檔案。")]
struct Args;

fn main() -> Result<()> {
    let _args = Args::parse();

    match get_contents()? {
        Some(contents) => print!("{}", contents),
        None => println!(),
    }

    Ok(())
}
