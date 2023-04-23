import axios from 'axios';
import ConstantList from '../../appConfig';
const API_PATH_employees = ConstantList.API_ENPOINT;

export const updateTour = (id, obj) => {
    const url = `http://localhost:8080/api/v1/toursAdmin/${id}`
    return axios.put(url, obj)
}

export const deleteTour = (obj) => {
    const url = `http://localhost:8080/api/v1/toursAdmin/${obj.id}`
    return axios.delete(url)
}

export const addTour = (obj) => {
    const url = `http://localhost:8080/api/v1/toursAdmin/add`
    return axios.post(url, obj)
}

export const getTour = () => {
    const url = `http://localhost:8080/api/v1/toursAdmin/all`;
    return axios.get(url);
};

export const getStaff = (data, pageSize) => {
    const url = `${API_PATH_employees}/employees?statuses=1,2,3,4,6&page=${data}&size=${pageSize}`;

    return axios.get(url);
};

export const getTotalItem = () => {
    const url = `${API_PATH_employees}/employees/total?statuses=1,2,3,4,6`;

    return axios.get(url);
};

export const getStaffById = (data) => {
    const url = `${API_PATH_employees}/employees/${data.employeeId}`;

    return axios.get(url, data);
};

export const addNewStaff = (data) => {
    const url = API_PATH_employees + '/employees';

    return axios.post(url, data);
};

export const updateStaff = (data) => {
    const url = `${API_PATH_employees}/employees/${data.employeeId}`;

    return axios.put(url, data);
};

export const deleteStaff = ({ employeeId }) => {
    const url = `${API_PATH_employees}/employees/${employeeId}/status`;

    return axios.put(url, { status: 14 });
};

export const sendLeaderStaff = ({ employeeId }) => {
    const url = `${API_PATH_employees}/employees/${employeeId}/status`;

    return axios.put(url, { status: 3 });
};

export const getFormStaff = ({ employeeId }) => {
    const url = `${API_PATH_employees}/employees/${employeeId}/form`;

    return axios.get(url);
};

export const updateFormStaff = (data) => {
    const url = `${API_PATH_employees}/employees/${data.employeeId}/form`;

    return axios.put(url, data);
};
