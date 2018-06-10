# Magento 2 Gulp Sass
Set of front-end tools for Magento 2, based on Gulp.js

## `themes.json` structure
Check `config/themes.json.sample` to get samples.
- `src` - full path to theme
- `dest` - full path to `pub/static/[theme_area]/[theme_vendor]/[theme_name]`
- `locale` - array of available locales
- `parent` - name of parent theme
- `stylesDir` - (default `styles`) path to styles directory. For `theme-blank-sass` it's `styles`. By default Magento 2 use `web/css`.
- `disableSuffix` - disable adding `.min` suffix using `--prod` flag.
- `postcss` - (deafult `["plugins.autoprefixer()"]`) PostCSS plugins config. Have to be an array.
- `modules` - list of modules witch you want to map inside your theme
- `ignore` - array of ignore patterns

## `watcher.json` structure
Check `config/watcher.json.sample` to get samples.
- `usePolling` - set this to `true` to successfully watch files over a network (i.e. Docker or Vagrant) or when your watcher dosen't work well. Warining, enabling this option may lead to high CPU utilization! [chokidar docs](https://github.com/paulmillr/chokidar#performance)

## Tasks list
* `babel` - Run [Babel](https://babeljs.io/), a compiler for writing next generation JavaScript.
  * `--theme name` - Process single theme.
  * `--prod` - Production output - minifies and uglyfy code.
* `clean` - Removes `/pub/static` directory content.
* `csslint` - Run [stylelint](https://github.com/stylelint/stylelint) based tests.
  * `--theme name` - Process single theme.
  * `--ci` - Enable throwing errors. Useful in CI/CD pipelines.
* `default` - type `gulp` to see this readme in console.
* `dev` - Runs [browserSync](https://www.browsersync.io/) and `inheritance`, `babel`, `styles`, `watch` tasks.
  * `--theme name` - Process single theme.
  * `--disableLinting` - Disable SASS and CSS linting.
  * `--disableMaps` - Toggles source maps generation.
* `eslint` - Watch and run [eslint](https://github.com/adametry/gulp-eslint) on specified JS file.
  * `--file fileName` - You have to specify what file you want to lint, fileName without .js.
* `inheritance` - Create necessary symlinks to resolve theme styles inheritance and make the base for styles processing. You have to run in before styles compilation and after adding new files.
* `sasslint` - Run [sass-lint](https://github.com/sasstools/sass-lint) based tests.
  * `--theme name` - Process single theme.
  * `--ci` - Enable throwing errors. Useful in CI/CD pipelines.
* `setup` - Creates a convenient symlink from `/tools` to `/vendor/snowdog/frontools` and copies all sample files if no configuration exists.
  * `--symlink name` - If you don't want to use `tools` as the symlink you can specify another name.
* `styles` - Use this task to manually trigger styles processing pipeline.
  * `--theme name` - Process single theme.
  * `--disableMaps` - Toggles source maps generation.
  * `--prod` - Production output - minifies styles and add `.min` sufix.
  * `--ci` - Enable throwing errors. Useful in CI/CD pipelines.
* `svg` - Run [svg-sprite](https://github.com/jkphl/gulp-svg-sprite) to generate SVG sprite.
  * `--theme name` - Process single theme.
* `watch` - Watch for style changes and run processing tasks.
  * `--theme name` - Process single theme.
  * `--disableLinting` - Disable SASS and CSS linting.
  * `--disableMaps` - Enable inline source maps generation.
