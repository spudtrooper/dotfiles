# dotfiles

dot files and things to do when you get a new laptop

* Swap ctrl and caps lock
* Change "Move left a space" and "Move right a space" to be Shift+Command to avoid conflict
* Install these dot files into `~`

    ```bash
    cp .zprofile .emacs .bash_prompt .bash_aliases .bash_functions ~
    ```

* Run `(package-refresh-contents)` before installing emacs packages
