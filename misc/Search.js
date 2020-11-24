export function searching(params, compare = []) {
    let value1 = params.toLowerCase().split(" ")
    let value2 = compare;
    let final = "";
    let status = false

    value1.map(query => {
        final = value2.filter(x =>
            x.toLowerCase().includes(query)
        );
        if (final.length > 0) return true;
    })

    if (final.length > 0) return true;

    return status;
};