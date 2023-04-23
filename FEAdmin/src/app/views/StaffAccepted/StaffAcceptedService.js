import axios from "axios";
import ConstantList from "../../appConfig";
const API_ROOT = ConstantList.API_ENPOINT


export const updateTourChiTiet = (id, obj) => {
    const url = `http://localhost:8080/api/v1/chiTietToursAdmin/update/${id}`
    return axios.put(url, obj)
}

export const deleteTourChiTiet = (id) => {
    const url = `http://localhost:8080/api/v1/chiTietToursAdmin/${id}`
    return axios.delete(url)
}

export const addTourChiTiet = (obj) => {
    const url = `http://localhost:8080/api/v1/chiTietToursAdmin/add`
    return axios.post(url, obj)
}

export const getTourChiTiet = () => {
    const url = `http://localhost:8080/api/v1/chiTietToursAdmin/getAll`
    return axios.get(url)
}

export const getByStatus = (obj) => {
    const url = API_ROOT + `/employees?statuses=${obj.arr.join(",")}&page=${obj.page}&size=100`
    return axios.get(url)
}

export const getById = (id) => {
    const url = API_ROOT + `/employees/${id}`
    return axios.get(url)
}

export const rejectEmployee = (obj) => {
    const url = API_ROOT + `/evolution/status`
    return axios.put(url, obj)
}

export const getTotalByStatus = (arr) => {
    const url = API_ROOT + `/employees/total?statuses=${arr.join(",")}`
    return axios.get(url)
}

export const getForm = (id) => {
    const url = API_ROOT + `/employees/${id}/form`
    return axios.get(url)
}