import axios from "axios";
import ConstantList from "../../appConfig";
const API_ROOT = ConstantList.API_ENPOINT

export const editPhieu = (id, obj) => {
    const url = `http://localhost:8080/api/v1/phieuAdmins/${id}`
    return axios.put(url, obj)
}

export const deletePhieu = (obj) => {
    const url = `http://localhost:8080/api/v1/phieuAdmins/${obj.id}`
    return axios.delete(url)
}

export const addPhieuDat = (obj) => {
    const url = `http://localhost:8080/api/v1/phieuAdmins/add`
    return axios.post(url, obj)
}

export const getPhieuDat = () => {
    const url = `http://localhost:8080/api/v1/phieuAdmins/getAll`
    return axios.get(url)
}


export const getTourId = (id) => {
    const url = `http://localhost:8080/api/v1/tours/${id}`
    return axios.get(url)
}

export const getChiTourById = (id) => {
    const url = `http://localhost:8080/api/v1/chitiet/${id}`
    return axios.get(url)
}

export const updateTrangThaiPhieuDat = (id) => {
    const url = `http://localhost:8080/api/v1/phieuAdmins/updateTrang/${id}`
    return axios.put(url, { trangThai: 1 })
}

