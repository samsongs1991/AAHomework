function titleize(names, callback) {
    let titleized = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
    callback(titleized);
}

function printCallback(titles) {
    titles.forEach(title => console.log(title));
}

