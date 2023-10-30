# starting-git

Introduction to git, github, github cli and github pages.

## Updating site

The project runs on make.
Use:

```         
make clean
make render
make preview
make publish
```

from a local instance.

Or do the quarto bits manually from the commandline.

To render all formats:

```         
quarto render
```

Note that neither `pdf` and `docx` formats echo out the implementation but the site does provide the code listings. To preview the updated book.

```         
quarto preview
```

To publish, first see here: https://quarto.org/docs/publishing/github-pages.html (and below). After that has been done once, you make sure that you are on the main branch (`git checkout main`) and then publish via the `quarto` command:

```         
quarto publish gh-pages
```

## gh-pages Setup

As noted above, to publish to github pages, first review the instructions here: https://quarto.org/docs/publishing/github-pages.html

The main points are as follows. Once they have been completed, they do not need to be run again. They assume that you have your repository setup and that all you changes have be committed and pushed to the remote.

The process below creates new `gh-pages` branch, initialises in a similar state to `git init`

```         
git checkout --orphan gh-pages
git reset --hard # make sure you've committed changes before running this!
git commit --allow-empty -m "Initialising gh-pages branch"
git push origin gh-pages
```


