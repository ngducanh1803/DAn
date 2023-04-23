import React, { Component, useEffect, useState } from "react";
import {
    DeleteFilled,
    EditFilled,
    EyeFilled,
    HomeFilled,
} from '@ant-design/icons';
import { Breadcrumb, Button, Form, Modal, Table, Tooltip } from 'antd';
import Styled from '../create-staff/CreateStaffStyled';
import { getPhieuDat, deletePhieu } from "./PendingService";
import SearchStaff from '../create-staff/Search';
import { toast } from 'react-toastify';
import moment from "moment";
import PendingDialog from "./PendingDialog";

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

function Pending() {

    const [searchInfo, setSearchInfo] = useState("")
    const [dataPhieu, setDataPhieu] = useState([])
    const [dataPhieuSearch, setDataPhieuSearch] = useState([])
    const [openDialogAdd, setOpenDialogAdd] = useState(false)
    const [openDialogDelete, setOpenDialogDelete] = useState(false)
    const [phieuDelete, setPhieuDelete] = useState()
    const [phieuEdit, setPhieuEdit] = useState()

    const [dem, setDem] = useState(0)

    const getPhieuDatFromBackEnd = async () => {
        const res = await getPhieuDat()
        // console.log("====>", res)
        setDataPhieu(res.data)
    }

    const onSearch = () => {
        const result = dataPhieu.filter(
            (item) =>
                item.ten.includes(searchInfo) ||
                item.diaChi.includes(searchInfo) ||
                item.sdt.toString() === searchInfo ||
                item.createDate.toString().includes(searchInfo)
        );
        setDataPhieuSearch(result)
        setDem(1)
    }

    const returnTour = () => {
        if (dataPhieuSearch.length === 0 && dem === 0) {
            return dataPhieu
        } else if (dataPhieuSearch.length === 0 && dem === 1) {
            return dataPhieuSearch
        }
        else {
            return dataPhieuSearch
        }
    }

    // =========== Xoa =============

    const onClickIconDelete = (rowData) => {
        // console.log("==>", rowData)
        setOpenDialogDelete(true)
        setPhieuDelete(rowData)
    }

    const onCancelDelete = () => {
        setOpenDialogDelete(false)
        setPhieuDelete()
    }

    const onOkDelete = async () => {
        const res = await deletePhieu(phieuDelete)
        if (res.status === 200) {
            toast.success("Xoa tour thanh cong")
        } else {
            toast.error("Loi !!!")
        }
        onCancelDelete()
        await getPhieuDatFromBackEnd()
    }

    // =============================

    // ========== Them =============
    const handleClickAdd = () => {
        setOpenDialogAdd(true)
    }

    const cancelDialogAdd = async () => {
        setOpenDialogAdd(false)
        setPhieuEdit()
        getPhieuDatFromBackEnd()
    }

    // ============================

    const onClickIconEdit = (rowData) => {
        setPhieuEdit(rowData)
        setOpenDialogAdd(true)
    }

    useEffect(() => {
        getPhieuDatFromBackEnd()
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
                    <SearchStaff
                        searchInfo={searchInfo} setSearchInfo={setSearchInfo} onSearch={onSearch}
                    />
                </div>

                {
                    openDialogAdd &&
                    <PendingDialog
                        item={phieuEdit}
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
                        { title: 'Ten', dataIndex: 'ten' },
                        { title: 'Dia chi', dataIndex: 'diaChi' },
                        { title: 'SDT', dataIndex: 'sdt' },
                        { title: 'Email', dataIndex: 'email' },
                        {
                            title: 'Ngay tao',
                            render: (rowData) => moment(rowData.createDate, 'YYYY-MM-DD').format('DD-MM-YYYY')
                        },
                        {
                            title: 'Tre em',
                            dataIndex: "treEm"
                        },
                        {
                            title: 'Tre nho',
                            dataIndex: "treNho"
                        },
                        {
                            title: 'Nguoi lon',
                            dataIndex: "nguoiLon"
                        },
                        {
                            title: 'Ghi chu',
                            dataIndex: "ghiChu"
                        },
                        { title: 'id tour', dataIndex: ["chiTietTour", "idChiTiet"] },

                    ]}
                    pagination={{
                        showSizeChanger: true,
                        pageSizeOptions: ['5', '10', '20'],
                    }}
                    scroll={{ y: 440 }}
                />
            </div>
        </Styled>
    )
}

export default Pending

/**
             "ten": "duc anh 1",
            "diaChi": "bac ninh",
            "sdt": "971533818",
            "email": "ducanh@gmail.com",
    *      "createDate": "2023-04-13",
         "treEm": 3,
        "treNho": 3,
        "nguoiLon": 4,
        "ghiChu": "nay anynay",
        "chiTietTour": {
            "idChiTiet": 1,
        }
 */