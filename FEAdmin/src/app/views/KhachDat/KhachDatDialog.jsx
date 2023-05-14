import React, { useEffect, useState } from "react";
import { Modal, Button, Tabs, Row, Col, Table, Image, Form, Input, Upload, Select } from "antd"

import styled from 'styled-components';
import moment from "moment";

import { toast } from "react-toastify";
import { values } from "lodash";
import { addKhachDat, updateKhachDat } from "./KhachDatService";
import { getAllKhachSan } from "../KhachSan/KhachSanService"

const { Option } = Select;

toast.configure({
    autoClose: 1000,
    draggable: false,
    limit: 3,
    closeOnClick: true
});

function KhachSanDialog(props) {

    const { open, onCancel, item } = props
    const [form] = Form.useForm()

    const [listKhachSan, setListKhachSan] = useState([])
    const [idKhachSan, setIdKhachSan] = useState()

    const handleSelectChange = (e) => {
        setIdKhachSan(e)
    }

    const submitForm = async (values) => {


        // const newValue = {
        //     ...values,
        //     hinhAnh: fileImage
        // }

        // console.log("==>", values)

        if (item) {
            const res = await updateKhachDat(item.id_khach, values)
            if (res.status === 200) {
                toast.success("Sua thanh cong")
            } else {
                toast.error("Loi roi !!!!!!!!!!!!!!")
            }
        } else {
            const res = await addKhachDat(values)
            console.log("==> res: ", res)
            if (res.status === 200) {
                toast.success("Them hanh cong")
            } else {
                toast.error("Loi roi !!!!!!!!!!!!!!")
            }
        }
        form.resetFields()
        onCancel()
    }

    useEffect(() => {
        // console.log("==>", item)
        if (item) {
            form.setFieldsValue(item)
        }
    }, [])

    useEffect(() => {
        const getListKhachSan = async () => {
            const res = await getAllKhachSan()
            // console.log("==>", res.data)
            const data = res.data
            const listKS = data.map((item) => {
                return {
                    idKhachSan: item.idKhachSan,
                    tenKS: item.tenKS
                }
            })
            // console.log("==>", listKS)
            setListKhachSan(listKS)
        }

        getListKhachSan()
    }, [])

    return (
        <Modal
            title="Them Tour"
            open={open}
            width={1000}
            style={{ height: 700 }}
            // onOk={handleOk} 
            onCancel={onCancel}
            footer={null}
        >
            <Form
                form={form}
                onFinish={submitForm}
                layout="vertical"
            >
                <Row gutter={[16, 16]}>

                    <Col span={6}>
                        <Form.Item
                            name="hoTen"
                            label="Ho Ten"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                            ]}
                        >
                            <Input />
                        </Form.Item>
                    </Col>

                    <Col span={6}>
                        <Form.Item
                            name="sdt"
                            label="sdt"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                            ]}
                        >
                            <Input />
                        </Form.Item>
                    </Col>

                    <Col span={6}>
                        <Form.Item
                            name="email"
                            label="email"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                            ]}
                        >
                            <Input />
                        </Form.Item>
                    </Col>
                </Row>

                <Row gutter={[16, 16]}>

                    <Col span={6}>
                        <Form.Item
                            name="diaChi"
                            label="diaChi"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                            ]}
                        >
                            <Input />
                        </Form.Item>
                    </Col>

                    <Col span={6}>
                        <Form.Item
                            name="yeuCau"
                            label="yeuCau"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                            ]}
                        >
                            <Input />
                        </Form.Item>
                    </Col>

                    <Col span={6}>
                        <Form.Item
                            name="idKS"
                            label="idKS"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                            ]}
                        >
                            <Select onChange={handleSelectChange}>
                                {
                                    listKhachSan && listKhachSan.map(item => {
                                        return (
                                            <Option key={item.id} value={item.idKhachSan}>{item.tenKS}</Option>
                                        )
                                    })
                                }
                            </Select>
                        </Form.Item>
                    </Col>
                </Row>


                <Row justify={"center"}>
                    <Form.Item>
                        <Button type="primary" htmlType="submit">
                            Submit
                        </Button>
                    </Form.Item>
                </Row>
            </Form>
        </Modal>
    )
}

export default KhachSanDialog
