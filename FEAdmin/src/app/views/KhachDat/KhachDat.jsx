import React, { useState, useEffect } from "react";

import Styled from '../create-staff/CreateStaffStyled';
import { deleteKhachDat, getAllKhachDat } from "./KhachDatService";
import {
    DeleteFilled,
    EditFilled,
    EyeFilled,
    HomeFilled,
} from '@ant-design/icons';
import { Breadcrumb, Button, Form, Modal, Table, Tooltip } from 'antd';
import SearchStaff from '../create-staff/Search';
import { toast } from 'react-toastify';
import moment from "moment";
import KhachDatDialog from "./KhachDatDialog";


toast.configure({
    autoClose: 1000,
    draggable: false,
    limit: 1000
});

const DialogDelete = (props) => {

    const { open, onOk, onCancel } = props

    return (
        <Modal
            title="Xoa Khach San"
            open={open}
            onOk={onOk}
            onCancel={onCancel}
        >
            <p>Ban co chac muon xoa ?</p>
        </Modal>
    )
}

const KhachDat = () => {

    const [searchInfo, setSearchInfo] = useState("")
    const [dem, setDem] = useState(0)
    const [dataKhachDatSearch, setDataKhachDatSearch] = useState([])

    const [data, setData] = useState([])
    const [khachDatEdit, setKhachDatEdit] = useState()
    const [openDialogAdd, setOpenDialogAdd] = useState(false)

    const [openDialogDelete, setOpenDialogDelete] = useState(false)
    const [khachDatDelete, setKhachDatDelete] = useState()

    // const [cellVisible, setCellVisible] = useState({});
    // const handleCellClick = (key) => {
    //     // console.log("==>key: ", key)
    //     setCellVisible({
    //         ...cellVisible,
    //         [key]: !cellVisible[key]
    //     });
    // };

    const onSearch = () => {
        const result = data.filter(
            (item) => {
                if (item.hoTen.toLowerCase().includes(searchInfo.toLowerCase()) || item.sdt.includes(searchInfo)) {
                    return true
                } else {
                    return false
                }
            }
        );
        setDataKhachDatSearch(result)
        setDem(1)
    }

    const returnKhachDat = () => {
        if (dataKhachDatSearch.length === 0 && dem === 0) {
            return data
        } else if (dataKhachDatSearch.length === 0 && dem === 1) {
            return dataKhachDatSearch
        }
        else {
            return dataKhachDatSearch
        }
    }

    // === get =====
    const getData = async () => {
        const res = await getAllKhachDat()
        // console.log("==> res", res.data)
        setData(res.data)
    }
    // =============

    // ======= them ========

    const handleClickAdd = () => {
        setKhachDatEdit()
        setOpenDialogAdd(true)
    }

    const cancelDialogAdd = async () => {
        setOpenDialogAdd(false)
        // setCellVisible({})
        setKhachDatEdit()
        getData()
    }

    // =====================
    // ======== sua =========
    const onClickIconEdit = (rowData) => {
        setKhachDatEdit(rowData)
        setOpenDialogAdd(true)
    }
    // ======================

    // ======= xoa  ===========

    const onClickIconDelete = (rowData) => {
        setOpenDialogDelete(true)
        setKhachDatDelete(rowData)
    }

    const onCancelDelete = () => {
        setOpenDialogDelete(false)
        setKhachDatDelete()
        setKhachDatEdit()
        // setCellVisible({})
    }

    const onOkDelete = async () => {
        const res = await deleteKhachDat(khachDatDelete.id_khach)

        if (res.status === 200) {
            toast.success("Xoa Tin Tuc thanh cong")
        } else {
            toast.error("Loi !!!")
        }
        onCancelDelete()
        await getData()
    }

    // ======================

    useEffect(() => {
        getData()
    }, [])

    return (
        <Styled>
            <div className="m-sm-30">
                <Breadcrumb style={{ padding: '0 0 30px 0' }}>
                    <Breadcrumb.Item href="/">
                        <HomeFilled />
                    </Breadcrumb.Item>
                    <Breadcrumb.Item href="/conclude/manage">
                        <span>Quản lý tour</span>
                    </Breadcrumb.Item>
                    <Breadcrumb.Item>Tin tức</Breadcrumb.Item>
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
                    <KhachDatDialog
                        item={khachDatEdit}
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
                    dataSource={returnKhachDat()}
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

                        {
                            title: 'hoTen',
                            dataIndex: "hoTen",
                        },
                        {
                            title: 'sdt',
                            // dataIndex: 'sdt',
                            render: (text, record) => "0" + record.sdt
                        },
                        {
                            title: "email",
                            dataIndex: "email"
                        },
                        {
                            title: "diaChi",
                            dataIndex: "diaChi"
                        },
                        {
                            title: "yeuCau",
                            dataIndex: "yeuCau"
                        },
                        {
                            title: "createDate",
                            dataIndex: "createDate",
                            render: (text, record) => moment(record.createDate, "YYYY-MM-DD").format("DD-MM-YYYY")
                        },
                        {
                            title: "idKS",
                            dataIndex: "ksName"
                        },
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

export default KhachDat
