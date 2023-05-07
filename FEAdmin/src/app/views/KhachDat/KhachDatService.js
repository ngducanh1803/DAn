import axios from "axios";

export const getAllKhachDat = () => {
    const url = `http://localhost:8080/api/v1/khachdatAdmin/all`
    return axios.get(url)
}

export const addKhachDat = (obj) => {
    const url = `http://localhost:8080/api/v1/khachdatAdmin/`
    return axios.post(url, obj)
}

export const updateKhachDat = (id, obj) => {
    const url = `http://localhost:8080/api/v1/khachdatAdmin/${id}`
    return axios.put(url, obj)
}

export const deleteKhachDat = (id) => {
    const url = `http://localhost:8080/api/v1/khachdatAdmin/${id}`
    return axios.delete(url)
}