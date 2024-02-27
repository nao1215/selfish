## selfish - the shell dyed in your selfish colors
selfish is an experimental shell and a project that will become my life's work. Over my ten-year engineering career, I've used bash, zsh, fish (and indirectly dash). All of them were great shells. However, I haven't found the perfect shell to suit my preferences entirely. So, I decided to create my own. I'll be using selfish in my everyday work and refine it to a level where I can dogfood it.

For the programming language, I've chosen OCaml. Although I'm a Gopher, I wanted to take some time away from Golang, hence the choice of OCaml. Rust, with its functional language elements, was also an appealing option since I plan to study OCaml alongside selfish. However, the project of creating a shell in Rust will likely be undertaken by other clever engineers. The quintessential shell will likely emerge from Rust. I want to create a shell in a different ecosystem with a different methodology.

### Development Eviorment Setup
Ref. [https://ocaml.org/install](https://ocaml.org/install)

1. Install the opam package manager
2. Initialise opam
3. Activate the opam switch
4. Set Up an OCaml Development Environment
   
```shell
$ bash -c "sh <(curl -fsSL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)"
$ opam init
$ eval $(opam env)
$ opam install ocaml-lsp-server odoc ocamlformat utop
```

### How to build
```shell
$ make build
```

### How to run
```shell
nao@nao:~/github/github.com/nao1215/selfish (main)$ ./_build/install/default/bin/selfish 
nao@nao:~/github/github.com/nao1215/selfish $   
```

### LICENSE
[MIT License](LICENSE) 