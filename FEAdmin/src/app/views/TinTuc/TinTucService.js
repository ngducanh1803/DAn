import axios from "axios";


export const getTinTucAll = () => {
    const url = `http://localhost:8080/api/v1/tintuc/all`
    return axios.get(url)
}


export const addTinTuc = (obj) => {
    const url = `http://localhost:8080/api/v1/tintucAdmin`
    return axios.post(url, obj)
}

export const updateTinTuc = (id, obj) => {
    const url = `http://localhost:8080/api/v1/tintucAdmin/${id}`
    return axios.put(url, obj)
}

export const deleteTinTuc = (id) => {
    const url = `http://localhost:8080/api/v1/tintucAdmin/${id}`
    return axios.delete(url)
}