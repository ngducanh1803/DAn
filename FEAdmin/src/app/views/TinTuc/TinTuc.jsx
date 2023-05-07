import React, { useState, useEffect } from "react";
import { deleteTinTuc, getTinTucAll } from "./TinTucService"
import Styled from '../create-staff/CreateStaffStyled';

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
import TinTucDialog from "./TinTucDialog"

toast.configure({
    autoClose: 1000,
    draggable: false,
    limit: 1000
});

const DialogDelete = (props) => {

    const { open, onOk, onCancel } = props

    return (
        <Modal
            title="Xoa Tin Tuc"
            open={open}
            onOk={onOk}
            onCancel={onCancel}
        >
            <p>Ban co chac muon xoa ?</p>
        </Modal>
    )
}

function TinTuc() {

    const [searchInfo, setSearchInfo] = useState("")
    const [dem, setDem] = useState(0)
    const [dataTinTucSearch, setDataTinTucSearch] = useState([])
    const [data, setData] = useState([])
    const [tinTucEdit, setTinTucEdit] = useState()

    const [openDialogAdd, setOpenDialogAdd] = useState(false)

    const [openDialogDelete, setOpenDialogDelete] = useState(false)
    const [tinTucDelete, setTinTucDelete] = useState()

    const [cellVisible, setCellVisible] = useState({});
    const handleCellClick = (key) => {
        setCellVisible({
            ...cellVisible,
            [key]: !cellVisible[key]
        });
    };

    const onSearch = () => {
        const result = data.filter(
            (item) => {
                if (item.tieuDe.toLowerCase().includes(searchInfo.toLowerCase())) {
                    return true
                } else {
                    return false
                }
            }
        );
        setDataTinTucSearch(result)
        setDem(1)
    }

    const returnTinTuc = () => {
        if (dataTinTucSearch.length === 0 && dem === 0) {
            return data
        } else if (dataTinTucSearch.length === 0 && dem === 1) {
            return dataTinTucSearch
        }
        else {
            return dataTinTucSearch
        }
    }

    // === get =====
    const getData = async () => {
        const res = await getTinTucAll()
        // console.log("==> res", res.data)
        setData(res.data)
    }
    // =============

    // ======= them ========

    const handleClickAdd = () => {
        setTinTucEdit()
        setOpenDialogAdd(true)
    }

    const cancelDialogAdd = async () => {
        setOpenDialogAdd(false)
        setCellVisible({})
        setTinTucEdit()
        getData()
    }

    // =====================

    // ======== sua =========
    const onClickIconEdit = (rowData) => {
        setTinTucEdit(rowData)
        setOpenDialogAdd(true)
    }
    // ======================

    // ======= xoa  ===========

    const onClickIconDelete = (rowData) => {
        setOpenDialogDelete(true)
        setTinTucDelete(rowData)
    }

    const onCancelDelete = () => {
        setOpenDialogDelete(false)
        setTinTucDelete()
        setTinTucEdit()
        setCellVisible({})
    }

    const onOkDelete = async () => {
        const res = await deleteTinTuc(tinTucDelete.id)
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
                    <TinTucDialog
                        item={tinTucEdit}
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
                        { title: 'Id', dataIndex: 'id', width: 50 },
                        {
                            title: 'Tiêu đề',
                            dataIndex: "tieuDe"
                        },
                        {
                            title: 'Nội Dung',
                            dataIndex: "noiDung",
                            render: (text, record) => {
                                return (
                                    <div onClick={() => handleCellClick(record.key)}>
                                        {cellVisible[record.key] ? text : record.noiDung.substring(0, 50) + "..."}
                                    </div>
                                );
                            }
                        },
                        {
                            title: 'Ảnh mô tả',
                            width: 120,
                            render: rowData => <img style={{ width: 100 }} src={rowData?.anhMot && `http://127.0.0.1:8887/${rowData.anhMot}`} alt="ing" />
                        },
                        {
                            title: 'Ảnh mô tả chi tiết',
                            width: 120,
                            render: rowData => <img style={{ width: 100 }} src={rowData?.anhHai && `http://127.0.0.1:8887/${rowData.anhHai}`} alt="ing" />
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

export default TinTuc
