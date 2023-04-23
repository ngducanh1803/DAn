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

export const getByStatus = (arr) => {
    const url = API_ROOT + `/employees?statuses=${arr.join(",")}&page=1&size=50`
    return axios.get(url)
}

export const getById = (id) => {
    const url = API_ROOT + `/employees/${id}`
    return axios.get(url)
}

export const rejectEmployee = (obj) => {
    const url = API_ROOT + `/employees/${obj.employeeId}/status`
    return axios.put(url, obj)
}

export const approveEmployee = (obj) => {
    const url = API_ROOT + `/employees/${obj.employeeId}/status`
    return axios.put(url, obj)
}

export const requiredSupplementEmployee = (obj) => {
    const url = API_ROOT + `/employees/${obj.employeeId}/status`
    return axios.put(url, obj)
}

export const getForm = (id) => {
    const url = API_ROOT + `/employees/${id}/form`
    return axios.get(url)
}

