import React, { useState, useEffect } from "react";

import Styled from '../create-staff/CreateStaffStyled';
import { deleteKhachSan, getAllKhachSan } from "./KhachSanService";
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
import KhachSanDialog from "./KhachSanDialog";


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

const KhachSan = () => {

    const [searchInfo, setSearchInfo] = useState("")
    const [dem, setDem] = useState(0)
    const [dataKhachSanSearch, setDataKhachSanSearch] = useState([])

    const [data, setData] = useState([])
    const [khachSanEdit, setKhachSanEdit] = useState()
    const [openDialogAdd, setOpenDialogAdd] = useState(false)

    const [openDialogDelete, setOpenDialogDelete] = useState(false)
    const [khachSanDelete, setKhachSanDelete] = useState()

    const [cellVisible, setCellVisible] = useState({});
    const handleCellClick = (key) => {
        // console.log("==>key: ", key)
        setCellVisible({
            ...cellVisible,
            [key]: !cellVisible[key]
        });
    };

    const onSearch = () => {
        const result = data.filter(
            (item) => {
                if (item.tenKS.toLowerCase().includes(searchInfo.toLowerCase())) {
                    return true
                } else {
                    return false
                }
            }
        );
        setDataKhachSanSearch(result)
        setDem(1)
    }

    const returnTinTuc = () => {
        if (dataKhachSanSearch.length === 0 && dem === 0) {
            return data
        } else if (dataKhachSanSearch.length === 0 && dem === 1) {
            return dataKhachSanSearch
        }
        else {
            return dataKhachSanSearch
        }
    }

    // === get =====
    const getData = async () => {
        const res = await getAllKhachSan()
        // console.log("==> res", res.data)
        setData(res.data)
    }
    // =============

    // ======= them ========

    const handleClickAdd = () => {
        setKhachSanEdit()
        setOpenDialogAdd(true)
    }

    const cancelDialogAdd = async () => {
        setOpenDialogAdd(false)
        setCellVisible({})
        setKhachSanEdit()
        getData()
    }

    // =====================
    // ======== sua =========
    const onClickIconEdit = (rowData) => {
        setKhachSanEdit(rowData)
        setOpenDialogAdd(true)
    }
    // ======================

    // ======= xoa  ===========

    const onClickIconDelete = (rowData) => {
        setOpenDialogDelete(true)
        setKhachSanDelete(rowData)
    }

    const onCancelDelete = () => {
        setOpenDialogDelete(false)
        setKhachSanDelete()
        setKhachSanEdit()
        setCellVisible({})
    }

    const onOkDelete = async () => {
        const res = await deleteKhachSan(khachSanDelete.idKhachSan)
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
                    <KhachSanDialog
                        item={khachSanEdit}
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
                    dataSource={returnTinTuc()}
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
                        { title: 'tenKS', dataIndex: 'tenKS' },
                        {
                            title: 'noiDung',
                            dataIndex: "noiDung",
                            render: (text, record) => {
                                return (
                                    <div onClick={() => handleCellClick(record.idKhachSan)}>
                                        {cellVisible[record.idKhachSan] ? text : record.noiDung.substring(0, 50) + "..."}
                                    </div>
                                );
                            }
                        },
                        {
                            title: 'diaChi',
                            dataIndex: "diaChi",
                        },
                        {
                            title: 'email',
                            dataIndex: 'email'
                        },
                        {
                            title: "sdt1",
                            // dataIndex: "sdt1",
                            render: rowData => "0" + rowData.sdt1
                        },
                        {
                            title: "sdt2",
                            // dataIndex: "sdt2"
                            render: rowData => "0" + rowData.sdt2
                        },
                        {
                            title: "gia",
                            dataIndex: "gia"
                        },
                        {
                            title: 'Ảnh mô tả chi tiết',
                            width: 120,
                            render: rowData => <img style={{ width: 100 }} src={rowData?.hinhAnh && `http://127.0.0.1:8887/${rowData.hinhAnh}`} alt="ing" />
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

export default KhachSan
