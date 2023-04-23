import {
    DeleteFilled,
    EditFilled,
    EyeFilled,
    HomeFilled,
} from '@ant-design/icons';
import { Breadcrumb, Button, Form, Modal, Table, Tooltip } from 'antd';
import React, { useEffect, useState } from 'react';
import Styled from './CreateStaffStyled';

// import data from '../../db.json';
import CreateStaffDialogAdd from './CreateStaffDialogAdd';
import { deleteTour, getTour } from "./CreateStaffService";
import SearchStaff from './Search';
import { toast } from 'react-toastify';

toast.configure({
    autoClose: 1000,
    draggable: false,
    limit: 1000
});

const DialogDelete = (props) => {

    const { open, onOk, onCancel } = props

    return (
        <Modal
            title="Xoa tour"
            open={open}
            onOk={onOk}
            onCancel={onCancel}
        >
            <p>Ban co chac muon xoa ?</p>
        </Modal>
    )
}


const CreateStaff = () => {

    const [searchInfo, setSearchInfo] = useState("")
    const [dataTour, setDataTour] = useState([])
    const [dataTourSearch, setDataTourSearch] = useState([])
    const [openDialogAdd, setOpenDialogAdd] = useState(false)
    const [openDialogDelete, setOpenDialogDelete] = useState(false)
    const [tourDelete, setTourDelete] = useState()
    const [tourEdit, setTourEdit] = useState()

    const [dem, setDem] = useState(0)

    const getTourFromBackEnd = async () => {
        const res = await getTour()
        setDataTour(res.data)
    }

    const onSearch = () => {
        const result = dataTour.filter(
            (item) =>
                item.tenTour.includes(searchInfo) ||
                item.xuatPhat.includes(searchInfo) ||
                item.giaNguoiLon.toString() === searchInfo ||
                item.giaTreEm.toString() === searchInfo ||
                item.giaTreNho.toString() === searchInfo
        );
        setDataTourSearch(result)
        setDem(1)
    }

    const returnTour = () => {
        if (dataTourSearch.length === 0 && dem === 0) {
            return dataTour
        } else if (dataTourSearch.length === 0 && dem === 1) {
            return dataTourSearch
        }
        else {
            return dataTourSearch
        }
    }

    // =========== Xoa =============

    const onClickIconDelete = (rowData) => {
        setOpenDialogDelete(true)
        setTourDelete(rowData)
    }

    const onCancelDelete = () => {
        setOpenDialogDelete(false)
        setTourDelete()
    }

    const onOkDelete = async () => {
        const res = await deleteTour(tourDelete)
        if (res.status === 200) {
            toast.success("Xoa tour thanh cong")
        } else {
            toast.error("Loi !!!")
        }
        onCancelDelete()
        await getTourFromBackEnd()
    }

    // =============================

    // ========== Them =============
    const handleClickAdd = () => {
        setOpenDialogAdd(true)
    }

    const cancelDialogAdd = async () => {
        setOpenDialogAdd(false)
        setTourEdit()
        getTourFromBackEnd()
    }

    // ============================

    // ========= Sua ==============

    const onClickIconEdit = (rowData) => {
        setTourEdit(rowData)
        setOpenDialogAdd(true)
    }

    // ============================

    // const getDataFisrt = async () => {
    //     await getTourFromBackEnd()
    //     onSearch()
    // }

    useEffect(() => {
        getTourFromBackEnd()
        // onSearch()
        // getDataFisrt()
    }, [])

    return (
        <Styled>
            <div className="m-sm-30">
                <Breadcrumb style={{ padding: '0 0 30px 0' }}>
                    <Breadcrumb.Item href="/">
                        <HomeFilled />
                    </Breadcrumb.Item>
                    <Breadcrumb.Item href="/conclude/manage">
                        <span>Quản lý nhân viên</span>
                    </Breadcrumb.Item>
                    <Breadcrumb.Item>Tạo mới</Breadcrumb.Item>
                </Breadcrumb>

                <div className='set-space-between'>
                    <Button size="middle"
                        onClick={handleClickAdd}
                        className="btn-add-new"
                    >
                        TẠO MỚI
                    </Button>
                    <SearchStaff searchInfo={searchInfo} setSearchInfo={setSearchInfo} onSearch={onSearch} />
                </div>

                {
                    openDialogAdd &&
                    <CreateStaffDialogAdd
                        item={tourEdit}
                        open={openDialogAdd}
                        onCancel={cancelDialogAdd}
                    />
                }

                {
                    openDialogDelete &&
                    <DialogDelete
                        open={openDialogDelete}
                        onOk={onOkDelete}
                        onCancel={onCancelDelete}
                    />
                }


                <Table
                    dataSource={returnTour()}
                    columns={[
                        {
                            key: 'action',
                            title: 'Thao tác',
                            dataIndex: 'action',
                            align: 'center',
                            width: 100,
                            render: (text, rowData) => {
                                return (
                                    <div
                                        className='createStaff-action'
                                        style={{ gap: "16px 16px" }}
                                    >
                                        <Tooltip placement="bottom" title="chỉnh sửa">
                                            <EditFilled
                                                style={{ color: "blue" }}
                                                onClick={() => onClickIconEdit(rowData)}
                                            />
                                        </Tooltip>

                                        <Tooltip placement="bottom" title="xóa">
                                            <DeleteFilled
                                                style={{ color: "red" }}
                                                onClick={() => onClickIconDelete(rowData)}
                                            />
                                        </Tooltip>
                                    </div>
                                );
                            },
                        },
                        { title: 'Ten tour', dataIndex: 'tenTour' },
                        { title: 'Phuong tien', dataIndex: 'phuongTien' },
                        { title: 'Xuat phat', dataIndex: 'xuatPhat' },
                        { title: 'So ngay', dataIndex: 'soNgay', width: 75, align: 'center' },
                        { title: 'So dem', dataIndex: 'soDem', width: 75, align: 'center' },
                        {
                            title: 'Gia nguoi lon',
                            width: 110,
                            align: 'center',
                            render: (rowData) => rowData.giaNguoiLon.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' })
                        },
                        {
                            title: 'Gia tre em',
                            width: 100,
                            align: 'center',
                            render: (rowData) => rowData.giaTreEm.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' })

                        },
                        {
                            title: 'Gia tre nho',
                            width: 100,
                            align: 'center',
                            render: (rowData) => rowData.giaTreNho.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' })
                        },
                        { title: 'Lich trinh', dataIndex: 'lichTrinh' },

                    ]}
                    pagination={{
                        showSizeChanger: true,
                        pageSizeOptions: ['5', '10', '20'],
                    }}
                    scroll={{ y: 440 }}
                />
            </div>
        </Styled>
    );

};

export default CreateStaff;

/*
{
        "id": 9,
        "tenTour": "Du lịch Đà Nẵng - Bà Nà - Hội An - Huế - Động Phong Nha",
        "phuongTien": "xe bus",
        "xuatPhat": "TP.Hồ Chí Minh",
        "soNgay": 3,
        "soDem": 3,
        "giaNguoiLon": 7.54898E7,
        "giaTreEm": 3784820.0,
        "giaTreNho": 23546.0,
        "lichTrinh": "Du lịch Đà Nẵng - Bà Nà - Hội An - Huế - Động Phong Nha",

*/
