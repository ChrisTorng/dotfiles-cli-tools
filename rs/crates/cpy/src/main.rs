use std::fs;
use std::io::{self, Read};
use std::path::PathBuf;

use anyhow::{Context, Result};
use clap::Parser;
use clipboard_util::set_contents;

#[derive(Parser)]
#[command(about = "複製檔案或標準輸入內容到剪貼簿，並提供備援檔案機制。")]
struct Args {
    /// 要複製的檔案路徑。不提供時會讀取標準輸入。
    path: Option<PathBuf>,
}

fn read_from_stdin() -> Result<Vec<u8>> {
    let mut buffer = Vec::new();
    io::stdin()
        .read_to_end(&mut buffer)
        .context("無法讀取標準輸入")?;
    Ok(buffer)
}

fn main() -> Result<()> {
    let args = Args::parse();

    let bytes = match args.path {
        Some(path) => {
            fs::read(&path).with_context(|| format!("無法讀取檔案：{}", path.display()))?
        }
        None => read_from_stdin()?,
    };

    let contents = String::from_utf8_lossy(&bytes).into_owned();
    set_contents(&contents)?;

    Ok(())
}
