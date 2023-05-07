import axios from "axios";

export const getAllKhachSan = () => {
    const url = `http://localhost:8080/api/v1/khachsanAdmin/all`
    return axios.get(url)
}

export const addKhachSan = (obj) => {
    const url = `http://localhost:8080/api/v1/khachsanAdmin`
    return axios.post(url, obj)
}

export const updateKhachSan = (id, obj) => {
    const url = `http://localhost:8080/api/v1/khachsanAdmin/${id}`
    return axios.put(url, obj)
}

export const deleteKhachSan = (id) => {
    const url = `http://localhost:8080/api/v1/khachsanAdmin/${id}`
    return axios.delete(url)
}