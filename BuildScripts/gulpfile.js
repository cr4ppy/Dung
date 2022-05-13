const { src, dest, series } = require('gulp');
const zip = require('gulp-zip');


function gulpAllAddonFiles() {
    return src([
        '../readme.md',
        '../locales.lua',
        '../init.lua',
        '../Events.lua',
        '../Dung.xml',
        '../Dung.toc',
        '../Dung.lua',
        '../Config.lua',

        '../Tests/*',
        '../Models/*',
        '../Helpers/*',
        '../Fixtures/*',
        '../Entities/*',
        '../Data/*',
    ],{ cwd: '../' }) //?????
}


function build_tbc(finish) {
    gulpAllAddonFiles().pipe(dest('../build/TBC'));
    finish();
}

function build_vanilla(finish) {
    gulpAllAddonFiles().pipe(dest('../build/Vanilla'));
    finish();
}

exports.default = series(build_tbc, build_vanilla);