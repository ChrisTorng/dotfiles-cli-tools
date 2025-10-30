use std::env;
use std::fs;
use std::io::Write;
use std::path::PathBuf;

use anyhow::{Context, Result};
use arboard::Clipboard;

const FALLBACK_FILENAME: &str = "dotfiles-cli-tools-clipboard.txt";

fn fallback_path() -> PathBuf {
    env::temp_dir().join(FALLBACK_FILENAME)
}

pub fn set_contents(contents: &str) -> Result<()> {
    if let Err(error) =
        Clipboard::new().and_then(|mut clipboard| clipboard.set_text(contents.to_owned()))
    {
        fs::write(fallback_path(), contents).with_context(|| "無法寫入剪貼簿備援檔案")?;
        let _ = writeln!(
            std::io::stderr(),
            "warning: 系統剪貼簿無法使用，已改寫入備援檔案：{}",
            error
        );
        return Ok(());
    }

    if let Err(error) = fs::write(fallback_path(), contents) {
        let _ = writeln!(
            std::io::stderr(),
            "warning: 無法同步備份剪貼簿內容：{}",
            error
        );
    }

    Ok(())
}

pub fn get_contents() -> Result<Option<String>> {
    match Clipboard::new().and_then(|mut clipboard| clipboard.get_text()) {
        Ok(contents) => return Ok(Some(contents)),
        Err(error) => {
            let _ = writeln!(
                std::io::stderr(),
                "warning: 系統剪貼簿無法讀取，嘗試使用備援檔案：{}",
                error
            );
        }
    }

    let path = fallback_path();
    if !path.exists() {
        return Ok(None);
    }

    let contents = fs::read_to_string(&path)
        .with_context(|| format!("無法讀取剪貼簿備援檔案：{}", path.display()))?;
    Ok(Some(contents))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn fallback_path_uses_temp_dir() {
        let path = fallback_path();
        assert!(path.starts_with(env::temp_dir()));
        assert!(path.ends_with(FALLBACK_FILENAME));
    }
}
