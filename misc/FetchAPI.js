//GET
export function getAll(url = "string") {
    let DATA = [];

    fetch(url
    ).then(
        item => item.json()
    ).then(
        item => {
            item.map(e => {
                DATA.push(e);
            })
        }
    ).catch(
        error => console.error('Erro ao obter dados:', error)
    );

    return DATA;
};

//POST
export function Post(data = {}, url = 'string') {
    fetch(url, {
        method: "POST",
        body: JSON.stringify(data),
        headers: {
            'Accept': 'application/json; charset=utf-8',
            'Content-Type': 'application/json;charset=UTF-8'
        }
    }).then(
        response => response
    ).catch(
        error => console.error('Erro ao enviar dados:', error)
    );
}

//PUT
export function Put(data = {}, url = 'string', id = 1) {
    fetch(url + id, {
        method: "PUT",
        body: JSON.stringify(data),
        headers: {
            'Accept': 'application/json; charset=utf-8',
            'Content-Type': 'application/json;charset=UTF-8'
        }
    }).then(
        response => response
    ).then(
        response => {
            console.log('Dados alterados com sucesso');
        }
    ).catch(
        error => console.error('Error:', error)
    );
}